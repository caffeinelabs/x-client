
// TweetAttachments.mo
/// Specifies the type of attachments (if any) present in this Tweet.

module {
    // User-facing type: what application code uses
    public type TweetAttachments = {
        /// A list of Media Keys for each one of the media attachments (if media are attached).
        media_keys : ?[Text];
        /// A list of Posts the media on this Tweet was originally posted in. For example, if the media on a tweet is re-used in another Tweet, this refers to the original, source Tweet..
        media_source_tweet_id : ?[Text];
        /// A list of poll IDs (if polls are attached).
        poll_ids : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetAttachments type
        public type JSON = {
            media_keys : ?[Text];
            media_source_tweet_id : ?[Text];
            poll_ids : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetAttachments) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetAttachments = ?json;
    }
}
