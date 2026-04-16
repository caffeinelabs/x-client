/// A X Community is a curated group of Posts.

// Community.mo

module {
    // User-facing type: what application code uses
    public type Community = {
        created_at : ?Text;
        /// The unique identifier of this Community.
        id : Text;
        /// The name of this Community.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Community type
        public type JSON = {
            created_at : ?Text;
            id : Text;
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Community) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Community = ?json;
    }
}
