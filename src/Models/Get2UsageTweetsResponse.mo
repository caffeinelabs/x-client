
import { type Problem; JSON = Problem } "./Problem";

import { type Usage; JSON = Usage } "./Usage";

// Get2UsageTweetsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsageTweetsResponse = {
        data : ?Usage;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsageTweetsResponse type
        public type JSON = {
            data : ?Usage;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsageTweetsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsageTweetsResponse = ?json;
    }
}
