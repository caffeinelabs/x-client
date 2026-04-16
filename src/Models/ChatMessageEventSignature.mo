/// Message event signature for verification.

import { type ChatMessageSigningKeyInfo; JSON = ChatMessageSigningKeyInfo } "./ChatMessageSigningKeyInfo";

// ChatMessageEventSignature.mo

module {
    // User-facing type: what application code uses
    public type ChatMessageEventSignature = {
        /// List of signing key information for message verification.
        message_signing_key_info_list : ?[ChatMessageSigningKeyInfo];
        /// The version of the public key used for signing.
        public_key_version : ?Text;
        /// The signature of the message event.
        signature : ?Text;
        /// The version of the signature algorithm.
        signature_version : ?Text;
        /// The public key used for signing.
        signing_public_key : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMessageEventSignature type
        public type JSON = {
            message_signing_key_info_list : ?[ChatMessageSigningKeyInfo];
            public_key_version : ?Text;
            signature : ?Text;
            signature_version : ?Text;
            signing_public_key : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMessageEventSignature) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMessageEventSignature = ?json;
    }
}
