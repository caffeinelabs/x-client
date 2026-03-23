
// GetPostsQuotedPostsExcludeParameterInner.mo
/// Enum values: #replies, #retweets

module {
    // User-facing type: type-safe variants for application code
    public type GetPostsQuotedPostsExcludeParameterInner = {
        #replies;
        #retweets;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetPostsQuotedPostsExcludeParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetPostsQuotedPostsExcludeParameterInner) : JSON =
            switch (value) {
                case (#replies) "replies";
                case (#retweets) "retweets";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetPostsQuotedPostsExcludeParameterInner =
            switch (json) {
                case "replies" ?#replies;
                case "retweets" ?#retweets;
                case _ null;
            };
    }
}
