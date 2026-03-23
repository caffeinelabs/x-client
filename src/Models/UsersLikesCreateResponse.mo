
import { type Problem; JSON = Problem } "./Problem";

import { type UsersLikesCreateResponseData; JSON = UsersLikesCreateResponseData } "./UsersLikesCreateResponseData";

// UsersLikesCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type UsersLikesCreateResponse = {
        data : ?UsersLikesCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersLikesCreateResponse type
        public type JSON = {
            data : ?UsersLikesCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersLikesCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersLikesCreateResponse = ?json;
    }
}
