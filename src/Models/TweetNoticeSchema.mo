
import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetNoticeSchema.mo

module {
    public type TweetNoticeSchema = {
        public_tweet_notice : TweetNotice;
    };

    public module JSON {
        public func toCandidValue(value : TweetNoticeSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("public_tweet_notice", TweetNotice.toCandidValue(value.public_tweet_notice)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNoticeSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?public_tweet_notice_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_tweet_notice") else return null;
                    let ?public_tweet_notice = (TweetNotice.fromCandidValue(public_tweet_notice_field.1)) else return null;
                    ?{
                        public_tweet_notice;
                    };
                };
                case _ null;
            };
    };
};
