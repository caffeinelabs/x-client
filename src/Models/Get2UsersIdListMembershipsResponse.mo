
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type List; JSON = List } "./List";

import { type Problem; JSON = Problem } "./Problem";

// Get2UsersIdListMembershipsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersIdListMembershipsResponse = {
        data : ?[List];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersIdListMembershipsResponse type
        public type JSON = {
            data : ?[List];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2DmConversationsIdDmEventsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersIdListMembershipsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersIdListMembershipsResponse = ?json;
    }
}
