/// User compliance event.

import { type UserComplianceData; JSON = UserComplianceData } "./UserComplianceData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserComplianceStreamResponseOneOf.mo

module {
    public type UserComplianceStreamResponseOneOf = {
        data : UserComplianceData;
    };

    public module JSON {
        public func toCandidValue(value : UserComplianceStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", UserComplianceData.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserComplianceStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (UserComplianceData.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
