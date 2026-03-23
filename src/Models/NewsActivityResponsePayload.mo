
// NewsActivityResponsePayload.mo

module {
    // User-facing type: what application code uses
    public type NewsActivityResponsePayload = {
        category : ?Text;
        headline : ?Text;
        hook : ?Text;
        summary : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NewsActivityResponsePayload type
        public type JSON = {
            category : ?Text;
            headline : ?Text;
            hook : ?Text;
            summary : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NewsActivityResponsePayload) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NewsActivityResponsePayload = ?json;
    }
}
