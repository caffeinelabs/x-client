
import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";

// ChatMessageEvent.mo
/// An Chat message event with extracted envelope fields and the original encoded event.

module {
    // User-facing type: what application code uses
    public type ChatMessageEvent = {
        /// The conversation ID this message belongs to.
        conversation_id : ?Text;
        /// The conversation token for this message.
        conversation_token : ?Text;
        /// The creation timestamp in milliseconds.
        created_at_msec : ?Text;
        /// Base64-encoded MessageEvent for client decoding.
        encoded_event : Text;
        /// The unique identifier for this message event (message_id).
        id : ?Text;
        /// Whether the message is from a trusted source.
        is_trusted : ?Bool;
        message_event_signature : ?ChatMessageEventSignature;
        /// The sequence ID of the previous message.
        previous_sequence_id : ?Text;
        /// The user ID of the message sender.
        sender_id : ?Text;
        /// The sequence identifier for ordering messages.
        sequence_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMessageEvent type
        public type JSON = {
            conversation_id : ?Text;
            conversation_token : ?Text;
            created_at_msec : ?Text;
            encoded_event : Text;
            id : ?Text;
            is_trusted : ?Bool;
            message_event_signature : ?ChatMessageEventSignature;
            previous_sequence_id : ?Text;
            sender_id : ?Text;
            sequence_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMessageEvent) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMessageEvent = ?json;
    }
}
