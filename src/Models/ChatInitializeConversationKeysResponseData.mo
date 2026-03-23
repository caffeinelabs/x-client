
// ChatInitializeConversationKeysResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatInitializeConversationKeysResponseData = {
        /// Sequence ID of the conversation key change event. Use this to track key changes in the conversation event stream.
        sequence_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatInitializeConversationKeysResponseData type
        public type JSON = {
            sequence_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatInitializeConversationKeysResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatInitializeConversationKeysResponseData = ?json;
    }
}
