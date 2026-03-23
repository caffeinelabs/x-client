
import { type ChatMessageEvent; JSON = ChatMessageEvent } "./ChatMessageEvent";

import { type Get2ChatConversationsIdResponseMeta; JSON = Get2ChatConversationsIdResponseMeta } "./Get2ChatConversationsIdResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// Get2ChatConversationsIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2ChatConversationsIdResponse = {
        data : ?[ChatMessageEvent];
        errors : ?[Problem];
        meta : ?Get2ChatConversationsIdResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ChatConversationsIdResponse type
        public type JSON = {
            data : ?[ChatMessageEvent];
            errors : ?[Problem];
            meta : ?Get2ChatConversationsIdResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ChatConversationsIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ChatConversationsIdResponse = ?json;
    }
}
