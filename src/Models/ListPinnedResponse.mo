
import { type ListPinnedResponseData; JSON = ListPinnedResponseData } "./ListPinnedResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ListPinnedResponse.mo

module {
    // User-facing type: what application code uses
    public type ListPinnedResponse = {
        data : ?ListPinnedResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListPinnedResponse type
        public type JSON = {
            data : ?ListPinnedResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListPinnedResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListPinnedResponse = ?json;
    }
}
