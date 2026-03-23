
import { type Engagement; JSON = Engagement } "./Engagement";

import { type Problem; JSON = Problem } "./Problem";

// Get2InsightsHistoricalResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2InsightsHistoricalResponse = {
        data : ?[Engagement];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2InsightsHistoricalResponse type
        public type JSON = {
            data : ?[Engagement];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2InsightsHistoricalResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2InsightsHistoricalResponse = ?json;
    }
}
