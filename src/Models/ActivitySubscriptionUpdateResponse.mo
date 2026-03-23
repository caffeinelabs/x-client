
import { type ActivitySubscriptionUpdateResponseData; JSON = ActivitySubscriptionUpdateResponseData } "./ActivitySubscriptionUpdateResponseData";

// ActivitySubscriptionUpdateResponse.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionUpdateResponse = {
        data : ?ActivitySubscriptionUpdateResponseData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionUpdateResponse type
        public type JSON = {
            data : ?ActivitySubscriptionUpdateResponseData.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionUpdateResponse) : JSON = {
            data = do ? { ActivitySubscriptionUpdateResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionUpdateResponse {
            ?{
                data = do ? { ActivitySubscriptionUpdateResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
