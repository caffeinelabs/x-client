/// Tweet Label event.

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetLabelStreamResponseOneOf.mo

module {
    public type TweetLabelStreamResponseOneOf = {
        data : TweetLabelData;
    };

    public module JSON {
        public func toCandidValue(value : TweetLabelStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", TweetLabelData.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetLabelStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (TweetLabelData.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
