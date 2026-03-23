
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";

// TweetComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetComplianceSchema = {
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        quote_tweet_id : ?Text;
        tweet : TweetComplianceSchemaTweet;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetComplianceSchema type
        public type JSON = {
            event_at : Text;
            quote_tweet_id : ?Text;
            tweet : TweetComplianceSchemaTweet;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetComplianceSchema = ?json;
    }
}
