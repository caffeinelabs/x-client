
import { type ChatConversation; JSON = ChatConversation } "./ChatConversation";

import { type ChatGetConversationsResponseMeta; JSON = ChatGetConversationsResponseMeta } "./ChatGetConversationsResponseMeta";

import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

// ChatGetConversationsResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatGetConversationsResponse = {
        /// List of conversations in the user's inbox.
        data : ?[ChatConversation];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?ChatGetConversationsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatGetConversationsResponse type
        public type JSON = {
            data : ?[ChatConversation];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?ChatGetConversationsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatGetConversationsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatGetConversationsResponse = ?json;
    }
}
