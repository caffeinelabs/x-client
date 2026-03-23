
import { type MediaAnalyticsDataInner; JSON = MediaAnalyticsDataInner } "./MediaAnalyticsDataInner";

import { type Problem; JSON = Problem } "./Problem";

// MediaAnalytics.mo

module {
    // User-facing type: what application code uses
    public type MediaAnalytics = {
        data : ?[MediaAnalyticsDataInner];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaAnalytics type
        public type JSON = {
            data : ?[MediaAnalyticsDataInner];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaAnalytics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaAnalytics = ?json;
    }
}
