
import { type Problem; JSON = Problem } "./Problem";

import { type SubscriptionsListGetResponseData; JSON = SubscriptionsListGetResponseData } "./SubscriptionsListGetResponseData";

// SubscriptionsListGetResponse.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsListGetResponse = {
        data : ?SubscriptionsListGetResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsListGetResponse type
        public type JSON = {
            data : ?SubscriptionsListGetResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsListGetResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsListGetResponse = ?json;
    }
}
