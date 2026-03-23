
import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";

// TweetNoticeSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetNoticeSchema = {
        public_tweet_notice : TweetNotice;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetNoticeSchema type
        public type JSON = {
            public_tweet_notice : TweetNotice;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetNoticeSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetNoticeSchema = ?json;
    }
}
