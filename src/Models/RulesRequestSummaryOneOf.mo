/// A summary of the results of the addition of user-specified stream filtering rules.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesRequestSummaryOneOf.mo

module {
    public type RulesRequestSummaryOneOf = {
        /// Number of user-specified stream filtering rules that were created.
        created : Int;
        /// Number of invalid user-specified stream filtering rules.
        invalid : Int;
        /// Number of user-specified stream filtering rules that were not created.
        not_created : Int;
        /// Number of valid user-specified stream filtering rules.
        valid : Int;
    };

    public module JSON {
        // `init` constructs a RulesRequestSummaryOneOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesRequestSummaryOneOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            created : Int;
            invalid : Int;
            not_created : Int;
            valid : Int;
        }) : RulesRequestSummaryOneOf {
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
};
