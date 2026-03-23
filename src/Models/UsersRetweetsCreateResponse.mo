
import { type Problem; JSON = Problem } "./Problem";

import { type UsersRetweetsCreateResponseData; JSON = UsersRetweetsCreateResponseData } "./UsersRetweetsCreateResponseData";

// UsersRetweetsCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type UsersRetweetsCreateResponse = {
        data : ?UsersRetweetsCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersRetweetsCreateResponse type
        public type JSON = {
            data : ?UsersRetweetsCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersRetweetsCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersRetweetsCreateResponse = ?json;
    }
}
