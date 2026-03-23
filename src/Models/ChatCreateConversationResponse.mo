
import { type ChatCreateConversationResponseData; JSON = ChatCreateConversationResponseData } "./ChatCreateConversationResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatCreateConversationResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatCreateConversationResponse = {
        data : ?ChatCreateConversationResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatCreateConversationResponse type
        public type JSON = {
            data : ?ChatCreateConversationResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatCreateConversationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatCreateConversationResponse = ?json;
    }
}
