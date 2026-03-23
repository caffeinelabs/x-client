
// ContentExpiration.mo

module {
    // User-facing type: what application code uses
    public type ContentExpiration = {
        /// Expiration time for content as a Unix timestamp in seconds
        timestamp_sec : Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ContentExpiration type
        public type JSON = {
            timestamp_sec : Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ContentExpiration) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ContentExpiration = ?json;
    }
}
