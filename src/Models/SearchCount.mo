/// Represent a Search Count Result.

// SearchCount.mo

module {
    // User-facing type: what application code uses
    public type SearchCount = {
        /// The end time of the bucket.
        end : Text;
        /// The start time of the bucket.
        start : Text;
        /// The count for the bucket.
        tweet_count : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchCount type
        public type JSON = {
            end : Text;
            start : Text;
            tweet_count : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchCount) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchCount = ?json;
    }
}
