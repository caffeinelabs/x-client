/// The topic of a Space, as selected by its creator.

// Topic.mo

module {
    // User-facing type: what application code uses
    public type Topic = {
        /// The description of the given topic.
        description : ?Text;
        /// Unique identifier of this Topic.
        id : Text;
        /// The name of the given topic.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Topic type
        public type JSON = {
            description : ?Text;
            id : Text;
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Topic) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Topic = ?json;
    }
}
