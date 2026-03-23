
// StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner.mo
/// Enum values: #created_at, #id, #liked_tweet_author_id, #liked_tweet_id, #timestamp_ms

module {
    // User-facing type: type-safe variants for application code
    public type StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner = {
        #created_at;
        #id;
        #liked_tweet_author_id;
        #liked_tweet_id;
        #timestamp_ms;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner) : JSON =
            switch (value) {
                case (#created_at) "created_at";
                case (#id) "id";
                case (#liked_tweet_author_id) "liked_tweet_author_id";
                case (#liked_tweet_id) "liked_tweet_id";
                case (#timestamp_ms) "timestamp_ms";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamLikesFirehoseLikeWithTweetAuthorFieldsParameterInner =
            switch (json) {
                case "created_at" ?#created_at;
                case "id" ?#id;
                case "liked_tweet_author_id" ?#liked_tweet_author_id;
                case "liked_tweet_id" ?#liked_tweet_id;
                case "timestamp_ms" ?#timestamp_ms;
                case _ null;
            };
    }
}
