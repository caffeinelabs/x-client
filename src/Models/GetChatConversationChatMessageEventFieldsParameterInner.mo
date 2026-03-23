
// GetChatConversationChatMessageEventFieldsParameterInner.mo
/// Enum values: #conversation_id, #conversation_token, #created_at_msec, #encoded_event, #id, #is_trusted, #message_event_signature, #previous_id, #sender_id

module {
    // User-facing type: type-safe variants for application code
    public type GetChatConversationChatMessageEventFieldsParameterInner = {
        #conversation_id;
        #conversation_token;
        #created_at_msec;
        #encoded_event;
        #id;
        #is_trusted;
        #message_event_signature;
        #previous_id;
        #sender_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetChatConversationChatMessageEventFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetChatConversationChatMessageEventFieldsParameterInner) : JSON =
            switch (value) {
                case (#conversation_id) "conversation_id";
                case (#conversation_token) "conversation_token";
                case (#created_at_msec) "created_at_msec";
                case (#encoded_event) "encoded_event";
                case (#id) "id";
                case (#is_trusted) "is_trusted";
                case (#message_event_signature) "message_event_signature";
                case (#previous_id) "previous_id";
                case (#sender_id) "sender_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetChatConversationChatMessageEventFieldsParameterInner =
            switch (json) {
                case "conversation_id" ?#conversation_id;
                case "conversation_token" ?#conversation_token;
                case "created_at_msec" ?#created_at_msec;
                case "encoded_event" ?#encoded_event;
                case "id" ?#id;
                case "is_trusted" ?#is_trusted;
                case "message_event_signature" ?#message_event_signature;
                case "previous_id" ?#previous_id;
                case "sender_id" ?#sender_id;
                case _ null;
            };
    }
}
