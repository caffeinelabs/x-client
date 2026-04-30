
import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNoticeSchema.mo

module {
    public type TweetNoticeSchema = {
        public_tweet_notice : TweetNotice;
    };

    public module JSON {
        // `init` constructs a TweetNoticeSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNoticeSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            public_tweet_notice : TweetNotice;
        }) : TweetNoticeSchema {
            let ?res = from_candid(to_candid(required)) : ?TweetNoticeSchema else Runtime.unreachable();
            res
        };

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
