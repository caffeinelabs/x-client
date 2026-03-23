
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";

// ChatCreateConversationRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatCreateConversationRequest = {
        /// Cryptographic signatures for the create action.
        action_signatures : ?[ChatActionSignature];
        /// Base64-encoded key rotation payload.
        base64_encoded_key_rotation : ?Text;
        /// Client-generated conversation ID.
        conversation_id : Text;
        /// Version of the conversation encryption key.
        conversation_key_version : Text;
        /// Encrypted conversation keys for each participant.
        conversation_participant_keys : [ChatConversationParticipantKey];
        /// User IDs of group admins. Defaults to the creator if omitted.
        group_admins : ?[Text];
        /// URL of the avatar image for the group conversation.
        group_avatar_url : ?Text;
        /// Description for the group conversation.
        group_description : ?Text;
        /// User IDs of group members to include in the conversation.
        group_members : [Text];
        /// Display name for the group conversation.
        group_name : ?Text;
        /// Message time-to-live in milliseconds. Messages expire after this duration.
        ttl_msec : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCreateConversationRequest type
        public type JSON = {
            action_signatures : ?[ChatActionSignature];
            base64_encoded_key_rotation : ?Text;
            conversation_id : Text;
            conversation_key_version : Text;
            conversation_participant_keys : [ChatConversationParticipantKey];
            group_admins : ?[Text];
            group_avatar_url : ?Text;
            group_description : ?Text;
            group_members : [Text];
            group_name : ?Text;
            ttl_msec : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCreateConversationRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCreateConversationRequest = ?json;
    }
}
