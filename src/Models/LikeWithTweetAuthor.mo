/// A Like event, with the tweet author user and the tweet being liked

// LikeWithTweetAuthor.mo

module {
    // User-facing type: what application code uses
    public type LikeWithTweetAuthor = {
        /// Creation time of the Tweet.
        created_at : ?Text;
        /// The unique identifier of this Like.
        id : ?Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        liked_tweet_id : ?Text;
        /// Timestamp in milliseconds of creation.
        timestamp_ms : ?Int;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_author_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer LikeWithTweetAuthor type
        public type JSON = {
            created_at : ?Text;
            id : ?Text;
            liked_tweet_id : ?Text;
            timestamp_ms : ?Int;
            tweet_author_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : LikeWithTweetAuthor) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?LikeWithTweetAuthor = ?json;
    }
}
