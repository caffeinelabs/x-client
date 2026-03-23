
import { type ActivitySubscriptionDeleteResponseData; JSON = ActivitySubscriptionDeleteResponseData } "./ActivitySubscriptionDeleteResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ListDeleteResponse.mo

module {
    // User-facing type: what application code uses
    public type ListDeleteResponse = {
        data : ?ActivitySubscriptionDeleteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListDeleteResponse type
        public type JSON = {
            data : ?ActivitySubscriptionDeleteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListDeleteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListDeleteResponse = ?json;
    }
}
