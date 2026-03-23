
// ChatMarkConversationReadRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatMarkConversationReadRequest = {
        /// The sequence ID of the last message to mark as read up to.
        seen_until_sequence_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMarkConversationReadRequest type
        public type JSON = {
            seen_until_sequence_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMarkConversationReadRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMarkConversationReadRequest = ?json;
    }
}
