/// A summary of the results of the addition of user-specified stream filtering rules.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

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
