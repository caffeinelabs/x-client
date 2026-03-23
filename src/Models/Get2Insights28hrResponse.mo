
import { type Engagement; JSON = Engagement } "./Engagement";

import { type Problem; JSON = Problem } "./Problem";

// Get2Insights28hrResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2Insights28hrResponse = {
        data : ?[Engagement];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2Insights28hrResponse type
        public type JSON = {
            data : ?[Engagement];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2Insights28hrResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2Insights28hrResponse = ?json;
    }
}
