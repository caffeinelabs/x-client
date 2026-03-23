
import { type ChatSendMessageResponseData; JSON = ChatSendMessageResponseData } "./ChatSendMessageResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatSendMessageResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatSendMessageResponse = {
        data : ?ChatSendMessageResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatSendMessageResponse type
        public type JSON = {
            data : ?ChatSendMessageResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatSendMessageResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatSendMessageResponse = ?json;
    }
}
