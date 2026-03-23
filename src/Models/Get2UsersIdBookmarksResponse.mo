
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// Get2UsersIdBookmarksResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersIdBookmarksResponse = {
        data : ?[Tweet];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersIdBookmarksResponse type
        public type JSON = {
            data : ?[Tweet];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2DmConversationsIdDmEventsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersIdBookmarksResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersIdBookmarksResponse = ?json;
    }
}
