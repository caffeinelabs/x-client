
// ChatSendMessageRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatSendMessageRequest = {
        /// Optional conversation token.
        conversation_token : ?Text;
        /// Base64-encoded Thrift MessageCreateEvent containing encrypted message contents.
        encoded_message_create_event : Text;
        /// Base64-encoded Thrift MessageEventSignature for message verification.
        encoded_message_event_signature : ?Text;
        /// Unique identifier for this message.
        message_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatSendMessageRequest type
        public type JSON = {
            conversation_token : ?Text;
            encoded_message_create_event : Text;
            encoded_message_event_signature : ?Text;
            message_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatSendMessageRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatSendMessageRequest = ?json;
    }
}
