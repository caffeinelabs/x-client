
import { type DmEvent; JSON = DmEvent } "./DmEvent";

import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

// Get2DmEventsEventIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2DmEventsEventIdResponse = {
        data : ?DmEvent;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2DmEventsEventIdResponse type
        public type JSON = {
            data : ?DmEvent;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2DmEventsEventIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2DmEventsEventIdResponse = ?json;
    }
}
