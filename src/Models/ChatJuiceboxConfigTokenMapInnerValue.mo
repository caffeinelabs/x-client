
// ChatJuiceboxConfigTokenMapInnerValue.mo
/// Realm connection details.

module {
    // User-facing type: what application code uses
    public type ChatJuiceboxConfigTokenMapInnerValue = {
        /// Realm URL.
        address : ?Text;
        /// Realm public key.
        public_key : ?Text;
        /// JWT auth token for the realm.
        token : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatJuiceboxConfigTokenMapInnerValue type
        public type JSON = {
            address : ?Text;
            public_key : ?Text;
            token : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatJuiceboxConfigTokenMapInnerValue) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatJuiceboxConfigTokenMapInnerValue = ?json;
    }
}
