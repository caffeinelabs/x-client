
// KillConnectionsByUuidsRequest.mo

module {
    // User-facing type: what application code uses
    public type KillConnectionsByUuidsRequest = {
        /// Array of connection UUIDs to terminate
        uuids : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer KillConnectionsByUuidsRequest type
        public type JSON = {
            uuids : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : KillConnectionsByUuidsRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?KillConnectionsByUuidsRequest = ?json;
    }
}
