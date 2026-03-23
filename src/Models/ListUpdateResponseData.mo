
// ListUpdateResponseData.mo

module {
    // User-facing type: what application code uses
    public type ListUpdateResponseData = {
        updated : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListUpdateResponseData type
        public type JSON = {
            updated : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListUpdateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUpdateResponseData = ?json;
    }
}
