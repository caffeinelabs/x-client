
import { type AnalyticsDataInner; JSON = AnalyticsDataInner } "./AnalyticsDataInner";

import { type Problem; JSON = Problem } "./Problem";

// Analytics.mo

module {
    // User-facing type: what application code uses
    public type Analytics = {
        data : ?[AnalyticsDataInner];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Analytics type
        public type JSON = {
            data : ?[AnalyticsDataInner];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Analytics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Analytics = ?json;
    }
}
