
import { type ActivitySubscriptionUpdateResponseData; JSON = ActivitySubscriptionUpdateResponseData } "./ActivitySubscriptionUpdateResponseData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivitySubscriptionUpdateResponse.mo

module {
    public type ActivitySubscriptionUpdateResponse = {
        data : ?ActivitySubscriptionUpdateResponseData;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionUpdateResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", ActivitySubscriptionUpdateResponseData.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionUpdateResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?ActivitySubscriptionUpdateResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (ActivitySubscriptionUpdateResponseData.fromCandidValue(data_field.1));
                        case null null;
                    };
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
