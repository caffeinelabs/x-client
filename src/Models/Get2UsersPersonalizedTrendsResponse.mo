
import { type PersonalizedTrend; JSON = PersonalizedTrend } "./PersonalizedTrend";

import { type Problem; JSON = Problem } "./Problem";

// Get2UsersPersonalizedTrendsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersPersonalizedTrendsResponse = {
        data : ?[PersonalizedTrend];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersPersonalizedTrendsResponse type
        public type JSON = {
            data : ?[PersonalizedTrend];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersPersonalizedTrendsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersPersonalizedTrendsResponse = ?json;
    }
}
