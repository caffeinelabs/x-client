
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type Space; JSON = Space } "./Space";

// Get2SpacesIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2SpacesIdResponse = {
        data : ?Space;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2SpacesIdResponse type
        public type JSON = {
            data : ?Space.JSON;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2SpacesIdResponse) : JSON = { value with
            data = do ? { Space.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2SpacesIdResponse {
            ?{ json with
                data = do ? { Space.fromJSON(json.data!)! };
            }
        };
    }
}
