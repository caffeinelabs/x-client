/// Represent the portion of text recognized as a Hashtag, and its start and end position within the text.

// HashtagFields.mo

module {
    // User-facing type: what application code uses
    public type HashtagFields = {
        /// The text of the Hashtag.
        tag : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer HashtagFields type
        public type JSON = {
            tag : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : HashtagFields) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?HashtagFields = ?json;
    }
}
