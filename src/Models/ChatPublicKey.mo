
import { type ChatJuiceboxConfig; JSON = ChatJuiceboxConfig } "./ChatJuiceboxConfig";

// ChatPublicKey.mo
/// A user's public key with associated key recovery configuration.

module {
    // User-facing type: what application code uses
    public type ChatPublicKey = {
        juicebox_config : ?ChatJuiceboxConfig;
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        /// Public key version.
        version : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatPublicKey type
        public type JSON = {
            juicebox_config : ?ChatJuiceboxConfig;
            public_key : ?Text;
            signing_public_key : ?Text;
            version : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatPublicKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatPublicKey = ?json;
    }
}
