
import { type BookmarkMutationResponseData; JSON = BookmarkMutationResponseData } "./BookmarkMutationResponseData";

import { type Problem; JSON = Problem } "./Problem";

// BookmarkMutationResponse.mo

module {
    // User-facing type: what application code uses
    public type BookmarkMutationResponse = {
        data : ?BookmarkMutationResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkMutationResponse type
        public type JSON = {
            data : ?BookmarkMutationResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkMutationResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkMutationResponse = ?json;
    }
}
