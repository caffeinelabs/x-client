/// Represent the portion of text recognized as a User mention, and its start and end position within the text.

// MentionFields.mo

module {
    // User-facing type: what application code uses
    public type MentionFields = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// The X handle (screen name) of this user.
        username : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MentionFields type
        public type JSON = {
            id : ?Text;
            username : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MentionFields) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MentionFields = ?json;
    }
}
