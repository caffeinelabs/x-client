
import { type ActivitySubscriptionDeleteResponseData; JSON = ActivitySubscriptionDeleteResponseData } "./ActivitySubscriptionDeleteResponseData";

import { type ActivitySubscriptionDeleteResponseMeta; JSON = ActivitySubscriptionDeleteResponseMeta } "./ActivitySubscriptionDeleteResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// ActivitySubscriptionDeleteResponse.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionDeleteResponse = {
        data : ?ActivitySubscriptionDeleteResponseData;
        errors : ?[Problem];
        meta : ?ActivitySubscriptionDeleteResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionDeleteResponse type
        public type JSON = {
            data : ?ActivitySubscriptionDeleteResponseData;
            errors : ?[Problem];
            meta : ?ActivitySubscriptionDeleteResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionDeleteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionDeleteResponse = ?json;
    }
}
