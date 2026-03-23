
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";

// ChatAddGroupMembersRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatAddGroupMembersRequest = {
        /// Cryptographic signatures for the add-members action.
        action_signatures : ?[ChatActionSignature];
        /// Version of the new rotated conversation key.
        conversation_key_version : ?Text;
        /// Encrypted conversation keys for each new participant after key rotation.
        conversation_participant_keys : ?[ChatConversationParticipantKey];
        /// Re-encrypted group avatar URL with new conversation key.
        encrypted_avatar_url : ?Text;
        /// Re-encrypted group title with new conversation key.
        encrypted_title : ?Text;
        /// List of user IDs to add to the group conversation.
        user_ids : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatAddGroupMembersRequest type
        public type JSON = {
            action_signatures : ?[ChatActionSignature];
            conversation_key_version : ?Text;
            conversation_participant_keys : ?[ChatConversationParticipantKey];
            encrypted_avatar_url : ?Text;
            encrypted_title : ?Text;
            user_ids : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatAddGroupMembersRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatAddGroupMembersRequest = ?json;
    }
}
