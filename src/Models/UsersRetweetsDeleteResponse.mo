
import { type Problem; JSON = Problem } "./Problem";

import { type UsersRetweetsDeleteResponseData; JSON = UsersRetweetsDeleteResponseData } "./UsersRetweetsDeleteResponseData";

// UsersRetweetsDeleteResponse.mo

module {
    // User-facing type: what application code uses
    public type UsersRetweetsDeleteResponse = {
        data : ?UsersRetweetsDeleteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersRetweetsDeleteResponse type
        public type JSON = {
            data : ?UsersRetweetsDeleteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersRetweetsDeleteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersRetweetsDeleteResponse = ?json;
    }
}
