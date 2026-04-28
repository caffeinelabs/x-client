
import { type TweetHideResponseData; JSON = TweetHideResponseData } "./TweetHideResponseData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetHideResponse.mo

module {
    public type TweetHideResponse = {
        data : ?TweetHideResponseData;
    };

    public module JSON {
        public func toCandidValue(value : TweetHideResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", TweetHideResponseData.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetHideResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?TweetHideResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (TweetHideResponseData.fromCandidValue(data_field.1));
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
