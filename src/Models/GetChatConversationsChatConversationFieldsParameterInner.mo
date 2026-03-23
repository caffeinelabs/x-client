
// GetChatConversationsChatConversationFieldsParameterInner.mo
/// Enum values: #admin_ids, #created_at, #group_avatar_url, #group_name, #id, #is_muted, #member_ids, #message_ttl_msec, #participant_ids, #screen_capture_blocking_enabled, #screen_capture_detection_enabled, #type_, #updated_at

module {
    // User-facing type: type-safe variants for application code
    public type GetChatConversationsChatConversationFieldsParameterInner = {
        #admin_ids;
        #created_at;
        #group_avatar_url;
        #group_name;
        #id;
        #is_muted;
        #member_ids;
        #message_ttl_msec;
        #participant_ids;
        #screen_capture_blocking_enabled;
        #screen_capture_detection_enabled;
        #type_;
        #updated_at;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetChatConversationsChatConversationFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetChatConversationsChatConversationFieldsParameterInner) : JSON =
            switch (value) {
                case (#admin_ids) "admin_ids";
                case (#created_at) "created_at";
                case (#group_avatar_url) "group_avatar_url";
                case (#group_name) "group_name";
                case (#id) "id";
                case (#is_muted) "is_muted";
                case (#member_ids) "member_ids";
                case (#message_ttl_msec) "message_ttl_msec";
                case (#participant_ids) "participant_ids";
                case (#screen_capture_blocking_enabled) "screen_capture_blocking_enabled";
                case (#screen_capture_detection_enabled) "screen_capture_detection_enabled";
                case (#type_) "type";
                case (#updated_at) "updated_at";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetChatConversationsChatConversationFieldsParameterInner =
            switch (json) {
                case "admin_ids" ?#admin_ids;
                case "created_at" ?#created_at;
                case "group_avatar_url" ?#group_avatar_url;
                case "group_name" ?#group_name;
                case "id" ?#id;
                case "is_muted" ?#is_muted;
                case "member_ids" ?#member_ids;
                case "message_ttl_msec" ?#message_ttl_msec;
                case "participant_ids" ?#participant_ids;
                case "screen_capture_blocking_enabled" ?#screen_capture_blocking_enabled;
                case "screen_capture_detection_enabled" ?#screen_capture_detection_enabled;
                case "type" ?#type_;
                case "updated_at" ?#updated_at;
                case _ null;
            };
    }
}
