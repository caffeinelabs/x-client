
// ChatCreateConversationResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatCreateConversationResponseData = {
        /// The ID of the created conversation.
        conversation_id : ?Text;
        /// Sequence ID of the conversation key change event, if applicable.
        conversation_key_change_sequence_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCreateConversationResponseData type
        public type JSON = {
            conversation_id : ?Text;
            conversation_key_change_sequence_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCreateConversationResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCreateConversationResponseData = ?json;
    }
}
