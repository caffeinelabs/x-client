
import { type ChatConversation; JSON = ChatConversation } "./ChatConversation";

import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2ChatConversationsIdResponseMeta; JSON = Get2ChatConversationsIdResponseMeta } "./Get2ChatConversationsIdResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// Get2ChatConversationsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2ChatConversationsResponse = {
        data : ?[ChatConversation];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2ChatConversationsIdResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ChatConversationsResponse type
        public type JSON = {
            data : ?[ChatConversation];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2ChatConversationsIdResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ChatConversationsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ChatConversationsResponse = ?json;
    }
}
