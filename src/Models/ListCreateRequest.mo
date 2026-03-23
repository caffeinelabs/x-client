
// ListCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type ListCreateRequest = {
        description : ?Text;
        name : Text;
        private_ : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListCreateRequest type
        public type JSON = {
            description : ?Text;
            name : Text;
            private_ : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListCreateRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCreateRequest = ?json;
    }
}
