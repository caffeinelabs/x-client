
// ChatConversationParticipantKey.mo
/// A participant's encrypted conversation key.

module {
    // User-facing type: what application code uses
    public type ChatConversationParticipantKey = {
        /// Conversation key encrypted with this participant's public key.
        encrypted_conversation_key : ?Text;
        /// Version of the participant's public key used for encryption.
        public_key_version : ?Text;
        /// Participant user ID.
        user_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatConversationParticipantKey type
        public type JSON = {
            encrypted_conversation_key : ?Text;
            public_key_version : ?Text;
            user_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatConversationParticipantKey) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatConversationParticipantKey = ?json;
    }
}
