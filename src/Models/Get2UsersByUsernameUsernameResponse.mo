
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";

// Get2UsersByUsernameUsernameResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersByUsernameUsernameResponse = {
        data : ?User;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersByUsernameUsernameResponse type
        public type JSON = {
            data : ?User.JSON;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersByUsernameUsernameResponse) : JSON = { value with
            data = do ? { User.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersByUsernameUsernameResponse {
            ?{ json with
                data = do ? { User.fromJSON(json.data!)! };
            }
        };
    }
}
