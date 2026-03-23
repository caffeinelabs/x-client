
import { type Problem; JSON = Problem } "./Problem";

import { type UsersFollowingCreateResponseData; JSON = UsersFollowingCreateResponseData } "./UsersFollowingCreateResponseData";

// UsersFollowingCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type UsersFollowingCreateResponse = {
        data : ?UsersFollowingCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersFollowingCreateResponse type
        public type JSON = {
            data : ?UsersFollowingCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersFollowingCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersFollowingCreateResponse = ?json;
    }
}
