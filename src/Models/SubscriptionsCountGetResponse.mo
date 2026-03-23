
import { type Problem; JSON = Problem } "./Problem";

import { type SubscriptionsCountGetResponseData; JSON = SubscriptionsCountGetResponseData } "./SubscriptionsCountGetResponseData";

// SubscriptionsCountGetResponse.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsCountGetResponse = {
        data : ?SubscriptionsCountGetResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsCountGetResponse type
        public type JSON = {
            data : ?SubscriptionsCountGetResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsCountGetResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsCountGetResponse = ?json;
    }
}
