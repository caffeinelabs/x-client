
import { type EvaluateNoteResponseData; JSON = EvaluateNoteResponseData } "./EvaluateNoteResponseData";

import { type Problem; JSON = Problem } "./Problem";

// EvaluateNoteResponse.mo

module {
    // User-facing type: what application code uses
    public type EvaluateNoteResponse = {
        data : ?EvaluateNoteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EvaluateNoteResponse type
        public type JSON = {
            data : ?EvaluateNoteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EvaluateNoteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EvaluateNoteResponse = ?json;
    }
}
