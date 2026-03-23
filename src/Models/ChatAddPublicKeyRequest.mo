
import { type ChatAddPublicKeyRequestPublicKey; JSON = ChatAddPublicKeyRequestPublicKey } "./ChatAddPublicKeyRequestPublicKey";

// ChatAddPublicKeyRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatAddPublicKeyRequest = {
        /// When true, the server generates a new version.
        generate_version : ?Bool;
        public_key : ChatAddPublicKeyRequestPublicKey;
        /// Public key version.
        version : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatAddPublicKeyRequest type
        public type JSON = {
            generate_version : ?Bool;
            public_key : ChatAddPublicKeyRequestPublicKey;
            version : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatAddPublicKeyRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatAddPublicKeyRequest = ?json;
    }
}
