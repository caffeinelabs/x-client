/// A Chat conversation resource representing either a direct or group conversation.

import { type ChatConversationType; JSON = ChatConversationType } "./ChatConversationType";

// ChatConversation.mo

module {
    // User-facing type: what application code uses
    public type ChatConversation = {
        /// User IDs of group admins. Only present for group conversations.
        admin_ids : ?[Text];
        /// ISO 8601 timestamp when the group was created. Only present for group conversations.
        created_at : ?Text;
        /// URL for the group avatar. Only present for group conversations.
        group_avatar_url : ?Text;
        /// Encrypted group name. Only present for group conversations.
        group_name : ?Text;
        /// The unique identifier for this conversation.
        id : Text;
        /// Whether notifications are muted for this conversation.
        is_muted : ?Bool;
        /// User IDs of group members. Only present for group conversations.
        member_ids : ?[Text];
        /// Message time-to-live in milliseconds.
        message_ttl_msec : ?Text;
        /// Array of user IDs who are participants in this conversation.
        participant_ids : ?[Text];
        /// Whether screen capture blocking is enabled for this conversation.
        screen_capture_blocking_enabled : ?Bool;
        /// Whether screen capture detection is enabled for this conversation.
        screen_capture_detection_enabled : ?Bool;
        type_ : ?ChatConversationType;
        /// ISO 8601 timestamp when the group was last updated. Only present for group conversations.
        updated_at : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatConversation type
        public type JSON = {
            admin_ids : ?[Text];
            created_at : ?Text;
            group_avatar_url : ?Text;
            group_name : ?Text;
            id : Text;
            is_muted : ?Bool;
            member_ids : ?[Text];
            message_ttl_msec : ?Text;
            participant_ids : ?[Text];
            screen_capture_blocking_enabled : ?Bool;
            screen_capture_detection_enabled : ?Bool;
            type_ : ?ChatConversationType.JSON;
            updated_at : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatConversation) : JSON = { value with
            type_ = do ? { ChatConversationType.toJSON(value.type_!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatConversation {
            ?{ json with
                type_ = do ? { ChatConversationType.fromJSON(json.type_!)! };
            }
        };
    }
}
