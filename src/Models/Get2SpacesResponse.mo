
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type Space; JSON = Space } "./Space";

// Get2SpacesResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2SpacesResponse = {
        data : ?[Space];
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2SpacesResponse type
        public type JSON = {
            data : ?[Space];
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2SpacesResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2SpacesResponse = ?json;
    }
}
