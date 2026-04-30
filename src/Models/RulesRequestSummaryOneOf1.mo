import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesRequestSummaryOneOf1.mo

module {
    /// The required-fields slice of RulesRequestSummaryOneOf1 — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Number of user-specified stream filtering rules that were deleted.
        deleted : Int;
        /// Number of user-specified stream filtering rules that were not deleted.
        not_deleted : Int;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express RulesRequestSummaryOneOf1 as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type RulesRequestSummaryOneOf1 = Required and Optional;

    public module JSON {
        // `init` constructs a RulesRequestSummaryOneOf1 from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesRequestSummaryOneOf1.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : RulesRequestSummaryOneOf1 {
            let ?res = from_candid(to_candid(required)) : ?RulesRequestSummaryOneOf1 else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : RulesRequestSummaryOneOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("deleted", #Int(value.deleted)));
            List.add(buf, ("not_deleted", #Int(value.not_deleted)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesRequestSummaryOneOf1 =
            switch (candid) {
                case (#Record(fields)) {
                    let ?deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "deleted") else return null;
                    let ?deleted = ((switch (deleted_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    let ?not_deleted_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "not_deleted") else return null;
                    let ?not_deleted = ((switch (not_deleted_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })) else return null;
                    ?{
                        deleted;
                        not_deleted;
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
