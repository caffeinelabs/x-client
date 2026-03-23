
import { type ChatInitializeConversationKeysResponseData; JSON = ChatInitializeConversationKeysResponseData } "./ChatInitializeConversationKeysResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatInitializeConversationKeysResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatInitializeConversationKeysResponse = {
        data : ?ChatInitializeConversationKeysResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatInitializeConversationKeysResponse type
        public type JSON = {
            data : ?ChatInitializeConversationKeysResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatInitializeConversationKeysResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatInitializeConversationKeysResponse = ?json;
    }
}
