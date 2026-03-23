
// ChatInitializeGroupResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatInitializeGroupResponseData = {
        /// The unique identifier for the initialized group conversation. This ID is prefixed with 'g' (e.g., 'g1234567890123456789'). Use this ID when calling POST /chat/conversations to create the group.
        conversation_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatInitializeGroupResponseData type
        public type JSON = {
            conversation_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatInitializeGroupResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatInitializeGroupResponseData = ?json;
    }
}
