
// StreamLikesFirehoseExpansionsParameterInner.mo
/// Enum values: #liked_tweet_author_id, #liked_tweet_id

module {
    // User-facing type: type-safe variants for application code
    public type StreamLikesFirehoseExpansionsParameterInner = {
        #liked_tweet_author_id;
        #liked_tweet_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamLikesFirehoseExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamLikesFirehoseExpansionsParameterInner) : JSON =
            switch (value) {
                case (#liked_tweet_author_id) "liked_tweet_author_id";
                case (#liked_tweet_id) "liked_tweet_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamLikesFirehoseExpansionsParameterInner =
            switch (json) {
                case "liked_tweet_author_id" ?#liked_tweet_author_id;
                case "liked_tweet_id" ?#liked_tweet_id;
                case _ null;
            };
    }
}
