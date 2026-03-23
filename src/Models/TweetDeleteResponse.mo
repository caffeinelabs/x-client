
import { type DeleteNoteResponseData; JSON = DeleteNoteResponseData } "./DeleteNoteResponseData";

import { type Problem; JSON = Problem } "./Problem";

// TweetDeleteResponse.mo

module {
    // User-facing type: what application code uses
    public type TweetDeleteResponse = {
        data : ?DeleteNoteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetDeleteResponse type
        public type JSON = {
            data : ?DeleteNoteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetDeleteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetDeleteResponse = ?json;
    }
}
