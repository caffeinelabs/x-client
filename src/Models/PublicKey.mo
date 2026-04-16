/// Public key information for Chat encryption

import { type PublicKeyTokenMap; JSON = PublicKeyTokenMap } "./PublicKeyTokenMap";

// PublicKey.mo

module {
    // User-facing type: what application code uses
    public type PublicKey = {
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        token_map : ?PublicKeyTokenMap;
        /// Public key version.
        version : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PublicKey type
        public type JSON = {
            public_key : ?Text;
            signing_public_key : ?Text;
            token_map : ?PublicKeyTokenMap;
            version : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PublicKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PublicKey = ?json;
    }
}
