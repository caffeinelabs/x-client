
import { type Problem; JSON = Problem } "./Problem";

import { type SubscriptionsCreateResponseData; JSON = SubscriptionsCreateResponseData } "./SubscriptionsCreateResponseData";

// SubscriptionsDeleteResponse.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsDeleteResponse = {
        data : ?SubscriptionsCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsDeleteResponse type
        public type JSON = {
            data : ?SubscriptionsCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsDeleteResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsDeleteResponse = ?json;
    }
}
