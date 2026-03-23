
import { type Community; JSON = Community } "./Community";

import { type Problem; JSON = Problem } "./Problem";

// Get2CommunitiesIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2CommunitiesIdResponse = {
        data : ?Community;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2CommunitiesIdResponse type
        public type JSON = {
            data : ?Community;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2CommunitiesIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2CommunitiesIdResponse = ?json;
    }
}
