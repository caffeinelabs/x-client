import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetChatConversationChatMessageEventFieldsParameterInner.mo
/// Enum values: #conversation_id, #conversation_token, #created_at_msec, #encoded_event, #id, #is_trusted, #message_event_signature, #previous_id, #sender_id

module {
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

    public module JSON {
        public func toCandidValue(value : GetChatConversationChatMessageEventFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#conversation_id) #Text("conversation_id");
                case (#conversation_token) #Text("conversation_token");
                case (#created_at_msec) #Text("created_at_msec");
                case (#encoded_event) #Text("encoded_event");
                case (#id) #Text("id");
                case (#is_trusted) #Text("is_trusted");
                case (#message_event_signature) #Text("message_event_signature");
                case (#previous_id) #Text("previous_id");
                case (#sender_id) #Text("sender_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetChatConversationChatMessageEventFieldsParameterInner =
            switch (candid) {
                case (#Text("conversation_id")) ?#conversation_id;
                case (#Text("conversation_token")) ?#conversation_token;
                case (#Text("created_at_msec")) ?#created_at_msec;
                case (#Text("encoded_event")) ?#encoded_event;
                case (#Text("id")) ?#id;
                case (#Text("is_trusted")) ?#is_trusted;
                case (#Text("message_event_signature")) ?#message_event_signature;
                case (#Text("previous_id")) ?#previous_id;
                case (#Text("sender_id")) ?#sender_id;
                case _ null;
            };

        public func toText(value : GetChatConversationChatMessageEventFieldsParameterInner) : Text =
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
    };
};
