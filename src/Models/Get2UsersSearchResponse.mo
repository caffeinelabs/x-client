
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2UsersSearchResponseMeta; JSON = Get2UsersSearchResponseMeta } "./Get2UsersSearchResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";

// Get2UsersSearchResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersSearchResponse = {
        data : ?[User];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2UsersSearchResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersSearchResponse type
        public type JSON = {
            data : ?[User];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2UsersSearchResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersSearchResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersSearchResponse = ?json;
    }
}
