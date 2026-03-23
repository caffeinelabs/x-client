
import { type Problem; JSON = Problem } "./Problem";

import { type Trend; JSON = Trend } "./Trend";

// Get2TrendsByWoeidWoeidResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TrendsByWoeidWoeidResponse = {
        data : ?[Trend];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TrendsByWoeidWoeidResponse type
        public type JSON = {
            data : ?[Trend];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TrendsByWoeidWoeidResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TrendsByWoeidWoeidResponse = ?json;
    }
}
