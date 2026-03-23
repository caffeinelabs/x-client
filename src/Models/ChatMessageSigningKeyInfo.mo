
// ChatMessageSigningKeyInfo.mo
/// Signing key information for message verification.

module {
    // User-facing type: what application code uses
    public type ChatMessageSigningKeyInfo = {
        /// The member ID associated with this signing key.
        member_id : ?Text;
        /// The version of the public key.
        public_key_version : ?Text;
        /// The signing public key.
        signing_public_key : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMessageSigningKeyInfo type
        public type JSON = {
            member_id : ?Text;
            public_key_version : ?Text;
            signing_public_key : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMessageSigningKeyInfo) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMessageSigningKeyInfo = ?json;
    }
}
