
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetComplianceSchema.mo

module {
    public type TweetComplianceSchema = {
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        quote_tweet_id : ?Text;
        tweet : TweetComplianceSchemaTweet;
    };

    public module JSON {
        public func toCandidValue(value : TweetComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            switch (value.quote_tweet_id) {
                case (?v__) List.add(buf, ("quote_tweet_id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("tweet", TweetComplianceSchemaTweet.toCandidValue(value.tweet)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let quote_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_tweet_id")) {
                        case (?quote_tweet_id_field) ((switch (quote_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (TweetComplianceSchemaTweet.fromCandidValue(tweet_field.1)) else return null;
                    ?{
                        event_at;
                        quote_tweet_id;
                        tweet;
                    };
                };
                case _ null;
            };
    };
};
