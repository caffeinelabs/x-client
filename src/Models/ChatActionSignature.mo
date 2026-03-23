
import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";

// ChatActionSignature.mo
/// Cryptographic signature for a chat action.

module {
    // User-facing type: what application code uses
    public type ChatActionSignature = {
        /// Base64-encoded message event detail.
        encoded_message_event_detail : ?Text;
        message_event_signature : ?ChatMessageEventSignature;
        /// ID of the message being signed.
        message_id : ?Text;
        /// Cryptographic signature payload.
        signature_payload : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatActionSignature type
        public type JSON = {
            encoded_message_event_detail : ?Text;
            message_event_signature : ?ChatMessageEventSignature;
            message_id : ?Text;
            signature_payload : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatActionSignature) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatActionSignature = ?json;
    }
}
