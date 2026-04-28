/// Compliance event.

import { type TweetComplianceData; JSON = TweetComplianceData } "./TweetComplianceData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetComplianceStreamResponseOneOf.mo

module {
    public type TweetComplianceStreamResponseOneOf = {
        data : TweetComplianceData;
    };

    public module JSON {
        public func toCandidValue(value : TweetComplianceStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", TweetComplianceData.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (TweetComplianceData.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
