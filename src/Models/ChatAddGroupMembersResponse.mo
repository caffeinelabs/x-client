
// ChatAddGroupMembersResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatAddGroupMembersResponse = {
        /// Sequence ID of the conversation key change event.
        conversation_key_change_sequence_id : ?Text;
        /// List of all current member IDs in the conversation.
        current_member_ids : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatAddGroupMembersResponse type
        public type JSON = {
            conversation_key_change_sequence_id : ?Text;
            current_member_ids : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatAddGroupMembersResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatAddGroupMembersResponse = ?json;
    }
}
