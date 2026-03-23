
import { type ListMutateResponseData; JSON = ListMutateResponseData } "./ListMutateResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ListMutateResponse.mo

module {
    // User-facing type: what application code uses
    public type ListMutateResponse = {
        data : ?ListMutateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListMutateResponse type
        public type JSON = {
            data : ?ListMutateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListMutateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListMutateResponse = ?json;
    }
}
