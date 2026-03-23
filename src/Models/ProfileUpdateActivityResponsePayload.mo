
// ProfileUpdateActivityResponsePayload.mo

module {
    // User-facing type: what application code uses
    public type ProfileUpdateActivityResponsePayload = {
        after : ?Text;
        before : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ProfileUpdateActivityResponsePayload type
        public type JSON = {
            after : ?Text;
            before : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ProfileUpdateActivityResponsePayload) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ProfileUpdateActivityResponsePayload = ?json;
    }
}
