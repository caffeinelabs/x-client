
// TweetCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type TweetCreateResponseData = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
        /// The content of the Tweet.
        text_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateResponseData type
        public type JSON = {
            id : Text;
            text_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateResponseData = ?json;
    }
}
