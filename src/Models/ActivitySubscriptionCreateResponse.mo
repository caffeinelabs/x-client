
import { type ActivitySubscriptionCreateResponseData; JSON = ActivitySubscriptionCreateResponseData } "./ActivitySubscriptionCreateResponseData";

import { type ActivitySubscriptionCreateResponseMeta; JSON = ActivitySubscriptionCreateResponseMeta } "./ActivitySubscriptionCreateResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// ActivitySubscriptionCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionCreateResponse = {
        data : ?ActivitySubscriptionCreateResponseData;
        errors : ?[Problem];
        meta : ?ActivitySubscriptionCreateResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionCreateResponse type
        public type JSON = {
            data : ?ActivitySubscriptionCreateResponseData.JSON;
            errors : ?[Problem];
            meta : ?ActivitySubscriptionCreateResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionCreateResponse) : JSON = { value with
            data = do ? { ActivitySubscriptionCreateResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionCreateResponse {
            ?{ json with
                data = do ? { ActivitySubscriptionCreateResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
