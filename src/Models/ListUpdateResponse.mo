
import { type ListUpdateResponseData; JSON = ListUpdateResponseData } "./ListUpdateResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ListUpdateResponse.mo

module {
    // User-facing type: what application code uses
    public type ListUpdateResponse = {
        data : ?ListUpdateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListUpdateResponse type
        public type JSON = {
            data : ?ListUpdateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListUpdateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListUpdateResponse = ?json;
    }
}
