
import { type DmEvent; JSON = DmEvent } "./DmEvent";

import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// Get2DmConversationsIdDmEventsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2DmConversationsIdDmEventsResponse = {
        data : ?[DmEvent];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2DmConversationsIdDmEventsResponse type
        public type JSON = {
            data : ?[DmEvent];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2DmConversationsIdDmEventsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2DmConversationsIdDmEventsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2DmConversationsIdDmEventsResponse = ?json;
    }
}
