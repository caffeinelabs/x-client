
import { type ChatInitializeGroupResponseData; JSON = ChatInitializeGroupResponseData } "./ChatInitializeGroupResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ChatInitializeGroupResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatInitializeGroupResponse = {
        data : ?ChatInitializeGroupResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatInitializeGroupResponse type
        public type JSON = {
            data : ?ChatInitializeGroupResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatInitializeGroupResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatInitializeGroupResponse = ?json;
    }
}
