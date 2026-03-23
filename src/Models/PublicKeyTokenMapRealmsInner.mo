
// PublicKeyTokenMapRealmsInner.mo

module {
    // User-facing type: what application code uses
    public type PublicKeyTokenMapRealmsInner = {
        /// Realm URL.
        address : ?Text;
        /// Realm identifier.
        realm_id : ?Text;
        /// JWT auth token for realm.
        token : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PublicKeyTokenMapRealmsInner type
        public type JSON = {
            address : ?Text;
            realm_id : ?Text;
            token : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PublicKeyTokenMapRealmsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PublicKeyTokenMapRealmsInner = ?json;
    }
}
