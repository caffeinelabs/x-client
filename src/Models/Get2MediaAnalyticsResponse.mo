
import { type MediaAnalytics; JSON = MediaAnalytics } "./MediaAnalytics";

import { type Problem; JSON = Problem } "./Problem";

// Get2MediaAnalyticsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2MediaAnalyticsResponse = {
        data : ?MediaAnalytics;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2MediaAnalyticsResponse type
        public type JSON = {
            data : ?MediaAnalytics;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2MediaAnalyticsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2MediaAnalyticsResponse = ?json;
    }
}
