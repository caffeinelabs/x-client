
import { type ListFollowedResponseData; JSON = ListFollowedResponseData } "./ListFollowedResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ListFollowedResponse.mo

module {
    // User-facing type: what application code uses
    public type ListFollowedResponse = {
        data : ?ListFollowedResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListFollowedResponse type
        public type JSON = {
            data : ?ListFollowedResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListFollowedResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListFollowedResponse = ?json;
    }
}
