
import { type ActivitySubscriptionDeleteResponseData; JSON = ActivitySubscriptionDeleteResponseData } "./ActivitySubscriptionDeleteResponseData";

import { type Problem; JSON = Problem } "./Problem";

// DeleteDmResponse.mo

module {
    // User-facing type: what application code uses
    public type DeleteDmResponse = {
        data : ?ActivitySubscriptionDeleteResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteDmResponse type
        public type JSON = {
            data : ?ActivitySubscriptionDeleteResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteDmResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteDmResponse = ?json;
    }
}
