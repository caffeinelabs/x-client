
// ChatGetConversationResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ChatGetConversationResponseMeta = {
        /// Conversation key change events needed for decryption.
        conversation_key_events : ?[Text];
        /// Whether there are more messages to fetch.
        has_more : ?Bool;
        /// Token to retrieve the next page of results.
        next_token : ?Text;
        /// The number of message events returned.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatGetConversationResponseMeta type
        public type JSON = {
            conversation_key_events : ?[Text];
            has_more : ?Bool;
            next_token : ?Text;
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatGetConversationResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatGetConversationResponseMeta = ?json;
    }
}
