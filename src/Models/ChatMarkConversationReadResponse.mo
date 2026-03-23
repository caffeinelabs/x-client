
import { type ChatMarkConversationReadResponseData; JSON = ChatMarkConversationReadResponseData } "./ChatMarkConversationReadResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatMarkConversationReadResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatMarkConversationReadResponse = {
        data : ?ChatMarkConversationReadResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMarkConversationReadResponse type
        public type JSON = {
            data : ?ChatMarkConversationReadResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMarkConversationReadResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMarkConversationReadResponse = ?json;
    }
}
