
import { type CreateDmEventResponseData; JSON = CreateDmEventResponseData } "./CreateDmEventResponseData";

import { type Problem; JSON = Problem } "./Problem";

// CreateDmEventResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateDmEventResponse = {
        data : ?CreateDmEventResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateDmEventResponse type
        public type JSON = {
            data : ?CreateDmEventResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateDmEventResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateDmEventResponse = ?json;
    }
}
