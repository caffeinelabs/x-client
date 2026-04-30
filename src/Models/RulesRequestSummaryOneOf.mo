/// A summary of the results of the addition of user-specified stream filtering rules.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesRequestSummaryOneOf.mo

module {
    /// The required-fields slice of RulesRequestSummaryOneOf — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Number of user-specified stream filtering rules that were created.
        created : Int;
        /// Number of invalid user-specified stream filtering rules.
        invalid : Int;
        /// Number of user-specified stream filtering rules that were not created.
        not_created : Int;
        /// Number of valid user-specified stream filtering rules.
        valid : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express RulesRequestSummaryOneOf as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type RulesRequestSummaryOneOf = Required and Optional;

    public module JSON {
        // `init` constructs a RulesRequestSummaryOneOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesRequestSummaryOneOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : RulesRequestSummaryOneOf {
            let ?res = from_candid(to_candid(required)) : ?RulesRequestSummaryOneOf else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : RulesRequestSummaryOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created", #Int(value.created)));
            List.add(buf, ("invalid", #Int(value.invalid)));
            List.add(buf, ("not_created", #Int(value.not_created)));
            List.add(buf, ("valid", #Int(value.valid)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesRequestSummaryOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created") else return null;
                    let ?created = ((switch (created_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?invalid_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "invalid") else return null;
                    let ?invalid = ((switch (invalid_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?not_created_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "not_created") else return null;
                    let ?not_created = ((switch (not_created_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?valid_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "valid") else return null;
                    let ?valid = ((switch (valid_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        created;
                        invalid;
                        not_created;
                        valid;
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
