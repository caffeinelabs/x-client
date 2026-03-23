
import { type CreateNoteResponseData; JSON = CreateNoteResponseData } "./CreateNoteResponseData";

import { type Problem; JSON = Problem } "./Problem";

// CreateNoteResponse.mo

module {
    // User-facing type: what application code uses
    public type CreateNoteResponse = {
        data : ?CreateNoteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateNoteResponse type
        public type JSON = {
            data : ?CreateNoteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateNoteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateNoteResponse = ?json;
    }
}
