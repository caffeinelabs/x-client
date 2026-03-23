
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";

// Get2UsersMeResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersMeResponse = {
        data : ?User;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersMeResponse type
        public type JSON = {
            data : ?User.JSON;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersMeResponse) : JSON = { value with
            data = do ? { User.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersMeResponse {
            ?{ json with
                data = do ? { User.fromJSON(json.data!)! };
            }
        };
    }
}
