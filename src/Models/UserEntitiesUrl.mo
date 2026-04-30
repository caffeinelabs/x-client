/// Expanded details for the URL specified in the User's profile, with start and end indices.

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserEntitiesUrl.mo

module {
    /// The required-fields slice of UserEntitiesUrl — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UserEntitiesUrl as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        urls : ?[UrlEntity];
    };

    public type UserEntitiesUrl = Required and Optional;

    public module JSON {
        // `init` constructs a UserEntitiesUrl from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserEntitiesUrl.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UserEntitiesUrl {
            let ?res = from_candid(to_candid(required)) : ?UserEntitiesUrl else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserEntitiesUrl) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.urls) {
                case (?v__) List.add(buf, ("urls", #Array(Array.map<UrlEntity, Candid.Candid>(v__, UrlEntity.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserEntitiesUrl =
            switch (candid) {
                case (#Record(fields)) {
                    let urls : ?[UrlEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "urls")) {
                        case (?urls_field) ((switch (urls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        urls;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
