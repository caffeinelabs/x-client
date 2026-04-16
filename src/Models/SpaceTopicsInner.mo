/// The X Topic object.

// SpaceTopicsInner.mo

module {
    // User-facing type: what application code uses
    public type SpaceTopicsInner = {
        /// The description of the given topic.
        description : ?Text;
        /// An ID suitable for use in the REST API.
        id : Text;
        /// The name of the given topic.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SpaceTopicsInner type
        public type JSON = {
            description : ?Text;
            id : Text;
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SpaceTopicsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SpaceTopicsInner = ?json;
    }
}
