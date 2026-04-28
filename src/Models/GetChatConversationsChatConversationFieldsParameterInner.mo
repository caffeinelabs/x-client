import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetChatConversationsChatConversationFieldsParameterInner.mo
/// Enum values: #admin_ids, #created_at, #group_avatar_url, #group_name, #id, #is_muted, #member_ids, #message_ttl_msec, #participant_ids, #screen_capture_blocking_enabled, #screen_capture_detection_enabled, #type_, #updated_at

module {
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

    public module JSON {
        public func toCandidValue(value : GetChatConversationsChatConversationFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#admin_ids) #Text("admin_ids");
                case (#created_at) #Text("created_at");
                case (#group_avatar_url) #Text("group_avatar_url");
                case (#group_name) #Text("group_name");
                case (#id) #Text("id");
                case (#is_muted) #Text("is_muted");
                case (#member_ids) #Text("member_ids");
                case (#message_ttl_msec) #Text("message_ttl_msec");
                case (#participant_ids) #Text("participant_ids");
                case (#screen_capture_blocking_enabled) #Text("screen_capture_blocking_enabled");
                case (#screen_capture_detection_enabled) #Text("screen_capture_detection_enabled");
                case (#type_) #Text("type");
                case (#updated_at) #Text("updated_at");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetChatConversationsChatConversationFieldsParameterInner =
            switch (candid) {
                case (#Text("admin_ids")) ?#admin_ids;
                case (#Text("created_at")) ?#created_at;
                case (#Text("group_avatar_url")) ?#group_avatar_url;
                case (#Text("group_name")) ?#group_name;
                case (#Text("id")) ?#id;
                case (#Text("is_muted")) ?#is_muted;
                case (#Text("member_ids")) ?#member_ids;
                case (#Text("message_ttl_msec")) ?#message_ttl_msec;
                case (#Text("participant_ids")) ?#participant_ids;
                case (#Text("screen_capture_blocking_enabled")) ?#screen_capture_blocking_enabled;
                case (#Text("screen_capture_detection_enabled")) ?#screen_capture_detection_enabled;
                case (#Text("type")) ?#type_;
                case (#Text("updated_at")) ?#updated_at;
                case _ null;
            };

        public func toText(value : GetChatConversationsChatConversationFieldsParameterInner) : Text =
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
    };
};
