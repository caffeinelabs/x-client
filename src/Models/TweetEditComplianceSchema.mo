
import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetEditComplianceSchema.mo

module {
    public type TweetEditComplianceSchema = {
        tweet_edit : TweetEditComplianceObjectSchema;
    };

    public module JSON {
        public func toCandidValue(value : TweetEditComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("tweet_edit", TweetEditComplianceObjectSchema.toCandidValue(value.tweet_edit)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetEditComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?tweet_edit_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet_edit") else return null;
                    let ?tweet_edit = (TweetEditComplianceObjectSchema.fromCandidValue(tweet_edit_field.1)) else return null;
                    ?{
                        tweet_edit;
                    };
                };
                case _ null;
            };
    };
};
