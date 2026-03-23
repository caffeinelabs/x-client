
// ChatAddPublicKeyRequestPublicKey.mo
/// Public key registration payload.

module {
    // User-facing type: what application code uses
    public type ChatAddPublicKeyRequestPublicKey = {
        /// Signature over the identity public key.
        identity_public_key_signature : ?Text;
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Fingerprint of the identity public key.
        public_key_fingerprint : ?Text;
        /// Registration method for the public key.
        registration_method : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        /// Signature over the signing public key.
        signing_public_key_signature : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatAddPublicKeyRequestPublicKey type
        public type JSON = {
            identity_public_key_signature : ?Text;
            public_key : ?Text;
            public_key_fingerprint : ?Text;
            registration_method : ?Text;
            signing_public_key : ?Text;
            signing_public_key_signature : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatAddPublicKeyRequestPublicKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatAddPublicKeyRequestPublicKey = ?json;
    }
}
