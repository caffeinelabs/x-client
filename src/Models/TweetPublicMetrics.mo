/// Engagement metrics for the Tweet at the time of the request.

// TweetPublicMetrics.mo

module {
    // User-facing type: what application code uses
    public type TweetPublicMetrics = {
        /// Number of times this Tweet has been bookmarked.
        bookmark_count : Int;
        /// Number of times this Tweet has been viewed.
        impression_count : Int;
        /// Number of times this Tweet has been liked.
        like_count : Int;
        /// Number of times this Tweet has been quoted.
        quote_count : ?Int;
        /// Number of times this Tweet has been replied to.
        reply_count : Int;
        /// Number of times this Tweet has been Retweeted.
        retweet_count : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetPublicMetrics type
        public type JSON = {
            bookmark_count : Int;
            impression_count : Int;
            like_count : Int;
            quote_count : ?Int;
            reply_count : Int;
            retweet_count : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetPublicMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetPublicMetrics = ?json;
    }
}
