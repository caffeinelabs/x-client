
// ListMutateResponseData.mo

module {
    // User-facing type: what application code uses
    public type ListMutateResponseData = {
        is_member : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListMutateResponseData type
        public type JSON = {
            is_member : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListMutateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListMutateResponseData = ?json;
    }
}
