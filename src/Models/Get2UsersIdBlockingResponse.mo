
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";

// Get2UsersIdBlockingResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersIdBlockingResponse = {
        data : ?[User];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersIdBlockingResponse type
        public type JSON = {
            data : ?[User];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2DmConversationsIdDmEventsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersIdBlockingResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersIdBlockingResponse = ?json;
    }
}
