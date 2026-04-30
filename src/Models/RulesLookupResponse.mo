
import { type Rule; JSON = Rule } "./Rule";

import { type RulesResponseMetadata; JSON = RulesResponseMetadata } "./RulesResponseMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesLookupResponse.mo

module {
    /// The required-fields slice of RulesLookupResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        meta : RulesResponseMetadata;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express RulesLookupResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        data : ?[Rule];
    };

    public type RulesLookupResponse = Required and Optional;

    public module JSON {
        // `init` constructs a RulesLookupResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesLookupResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : RulesLookupResponse {
            let ?res = from_candid(to_candid(required)) : ?RulesLookupResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : RulesLookupResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<Rule, Candid.Candid>(v__, Rule.toCandidValue))));
                case null ();
            };
            List.add(buf, ("meta", RulesResponseMetadata.toCandidValue(value.meta)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesLookupResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[Rule] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Rule>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Rule.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?meta_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta") else return null;
                    let ?meta = (RulesResponseMetadata.fromCandidValue(meta_field.1)) else return null;
                    ?{
                        data;
                        meta;
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
