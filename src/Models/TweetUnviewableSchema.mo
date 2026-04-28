
import { type TweetUnviewable; JSON = TweetUnviewable } "./TweetUnviewable";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetUnviewableSchema.mo

module {
    public type TweetUnviewableSchema = {
        public_tweet_unviewable : TweetUnviewable;
    };

    public module JSON {
        public func toCandidValue(value : TweetUnviewableSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("public_tweet_unviewable", TweetUnviewable.toCandidValue(value.public_tweet_unviewable)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetUnviewableSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?public_tweet_unviewable_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_tweet_unviewable") else return null;
                    let ?public_tweet_unviewable = (TweetUnviewable.fromCandidValue(public_tweet_unviewable_field.1)) else return null;
                    ?{
                        public_tweet_unviewable;
                    };
                };
                case _ null;
            };
    };
};
