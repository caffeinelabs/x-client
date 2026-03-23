
// TweetCreateRequestReply.mo
/// Tweet information of the Tweet being replied to.

module {
    // User-facing type: what application code uses
    public type TweetCreateRequestReply = {
        /// If set to true, reply metadata will be automatically populated.
        auto_populate_reply_metadata : ?Bool;
        /// A list of User Ids to be excluded from the reply Tweet.
        exclude_reply_user_ids : ?[Text];
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        in_reply_to_tweet_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestReply type
        public type JSON = {
            auto_populate_reply_metadata : ?Bool;
            exclude_reply_user_ids : ?[Text];
            in_reply_to_tweet_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestReply) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestReply = ?json;
    }
}
