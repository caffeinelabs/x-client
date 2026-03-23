
import { type ChatSendTypingIndicatorResponseData; JSON = ChatSendTypingIndicatorResponseData } "./ChatSendTypingIndicatorResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatSendTypingIndicatorResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatSendTypingIndicatorResponse = {
        data : ?ChatSendTypingIndicatorResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatSendTypingIndicatorResponse type
        public type JSON = {
            data : ?ChatSendTypingIndicatorResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatSendTypingIndicatorResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatSendTypingIndicatorResponse = ?json;
    }
}
