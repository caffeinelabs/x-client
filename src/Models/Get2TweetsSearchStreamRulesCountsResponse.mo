
import { type Problem; JSON = Problem } "./Problem";

import { type RulesCount; JSON = RulesCount } "./RulesCount";

// Get2TweetsSearchStreamRulesCountsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsSearchStreamRulesCountsResponse = {
        data : ?RulesCount;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsSearchStreamRulesCountsResponse type
        public type JSON = {
            data : ?RulesCount;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsSearchStreamRulesCountsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsSearchStreamRulesCountsResponse = ?json;
    }
}
