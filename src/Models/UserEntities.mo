/// A list of metadata found in the User's profile description.

import { type FullTextEntities; JSON = FullTextEntities } "./FullTextEntities";

import { type UserEntitiesUrl; JSON = UserEntitiesUrl } "./UserEntitiesUrl";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserEntities.mo

module {
    /// The required-fields slice of UserEntities — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UserEntities as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        description : ?FullTextEntities;
        url : ?UserEntitiesUrl;
    };

    public type UserEntities = Required and Optional;

    public module JSON {
        // `init` constructs a UserEntities from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UserEntities.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UserEntities {
            let ?res = from_candid(to_candid(required)) : ?UserEntities else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UserEntities) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", FullTextEntities.toCandidValue(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", UserEntitiesUrl.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserEntities =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?FullTextEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) (FullTextEntities.fromCandidValue(description_field.1));
                        case null null;
                    };
                    let url : ?UserEntitiesUrl = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) (UserEntitiesUrl.fromCandidValue(url_field.1));
                        case null null;
                    };
                    ?{
                        description;
                        url;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
