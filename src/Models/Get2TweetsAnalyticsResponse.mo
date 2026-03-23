
import { type Analytics; JSON = Analytics } "./Analytics";

import { type Problem; JSON = Problem } "./Problem";

// Get2TweetsAnalyticsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsAnalyticsResponse = {
        data : ?Analytics;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsAnalyticsResponse type
        public type JSON = {
            data : ?Analytics;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsAnalyticsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsAnalyticsResponse = ?json;
    }
}
