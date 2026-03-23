
// KillAllConnectionsResponseDataResultsInner.mo

module {
    // User-facing type: what application code uses
    public type KillAllConnectionsResponseDataResultsInner = {
        error_message : ?Text;
        success : ?Bool;
        uuid : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer KillAllConnectionsResponseDataResultsInner type
        public type JSON = {
            error_message : ?Text;
            success : ?Bool;
            uuid : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : KillAllConnectionsResponseDataResultsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?KillAllConnectionsResponseDataResultsInner = ?json;
    }
}
