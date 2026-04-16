/// A list of metrics for this User.

// UserPublicMetrics.mo

module {
    // User-facing type: what application code uses
    public type UserPublicMetrics = {
        /// Number of Users who are following this User.
        followers_count : Int;
        /// Number of Users this User is following.
        following_count : Int;
        /// The number of likes created by this User.
        like_count : ?Int;
        /// The number of lists that include this User.
        listed_count : Int;
        /// The number of Posts (including Retweets) posted by this User.
        tweet_count : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserPublicMetrics type
        public type JSON = {
            followers_count : Int;
            following_count : Int;
            like_count : ?Int;
            listed_count : Int;
            tweet_count : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserPublicMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserPublicMetrics = ?json;
    }
}
