
import { type Expansions; JSON = Expansions } "./Expansions";

import { type List; JSON = List } "./List";

import { type Problem; JSON = Problem } "./Problem";

// Get2ListsIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2ListsIdResponse = {
        data : ?List;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ListsIdResponse type
        public type JSON = {
            data : ?List;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ListsIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ListsIdResponse = ?json;
    }
}
