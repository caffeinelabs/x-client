
import { type MuteUserMutationResponseData; JSON = MuteUserMutationResponseData } "./MuteUserMutationResponseData";

import { type Problem; JSON = Problem } "./Problem";

// MuteUserMutationResponse.mo

module {
    // User-facing type: what application code uses
    public type MuteUserMutationResponse = {
        data : ?MuteUserMutationResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MuteUserMutationResponse type
        public type JSON = {
            data : ?MuteUserMutationResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MuteUserMutationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MuteUserMutationResponse = ?json;
    }
}
