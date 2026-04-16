/// Options for editing an existing Post. When provided, this request will edit the specified Post instead of creating a new one.

// TweetCreateRequestEditOptions.mo

module {
    // User-facing type: what application code uses
    public type TweetCreateRequestEditOptions = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        previous_post_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestEditOptions type
        public type JSON = {
            previous_post_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestEditOptions) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestEditOptions = ?json;
    }
}
