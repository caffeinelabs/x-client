import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2ComplianceJobsResponseMeta.mo

module {
    public type Get2ComplianceJobsResponseMeta = {
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : Get2ComplianceJobsResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.result_count) {
                case (?v__) List.add(buf, ("result_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2ComplianceJobsResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "result_count")) {
                        case (?result_count_field) ((switch (result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        result_count;
                    };
                };
                case _ null;
            };
    };
};
