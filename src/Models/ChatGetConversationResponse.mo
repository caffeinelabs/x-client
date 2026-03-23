
import { type ChatGetConversationResponseMeta; JSON = ChatGetConversationResponseMeta } "./ChatGetConversationResponseMeta";

import { type ChatMessageEvent; JSON = ChatMessageEvent } "./ChatMessageEvent";

import { type Problem; JSON = Problem } "./Problem";

// ChatGetConversationResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatGetConversationResponse = {
        /// List of message events in the conversation.
        data : ?[ChatMessageEvent];
        errors : ?[Problem];
        meta : ?ChatGetConversationResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatGetConversationResponse type
        public type JSON = {
            data : ?[ChatMessageEvent];
            errors : ?[Problem];
            meta : ?ChatGetConversationResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatGetConversationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatGetConversationResponse = ?json;
    }
}
