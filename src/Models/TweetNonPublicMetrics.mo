/// Nonpublic engagement metrics for the Tweet at the time of the request.

// TweetNonPublicMetrics.mo

module {
    // User-facing type: what application code uses
    public type TweetNonPublicMetrics = {
        /// Number of times this Tweet has been viewed.
        impression_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetNonPublicMetrics type
        public type JSON = {
            impression_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetNonPublicMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetNonPublicMetrics = ?json;
    }
}
