
// ChatSendMessageResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatSendMessageResponseData = {
        /// Base64-encoded response message event.
        encoded_message_event : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatSendMessageResponseData type
        public type JSON = {
            encoded_message_event : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatSendMessageResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatSendMessageResponseData = ?json;
    }
}
