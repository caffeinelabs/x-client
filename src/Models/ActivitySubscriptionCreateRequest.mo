
import { type ActivitySubscriptionCreateRequestEventType; JSON = ActivitySubscriptionCreateRequestEventType } "./ActivitySubscriptionCreateRequestEventType";

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";

// ActivitySubscriptionCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionCreateRequest = {
        event_type : ActivitySubscriptionCreateRequestEventType;
        filter : ActivitySubscriptionFilter;
        tag : ?Text;
        /// The unique identifier of this webhook config.
        webhook_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionCreateRequest type
        public type JSON = {
            event_type : ActivitySubscriptionCreateRequestEventType.JSON;
            filter : ActivitySubscriptionFilter.JSON;
            tag : ?Text;
            webhook_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionCreateRequest) : JSON = { value with
            event_type = ActivitySubscriptionCreateRequestEventType.toJSON(value.event_type);
            filter = ActivitySubscriptionFilter.toJSON(value.filter);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionCreateRequest {
            let ?event_type = ActivitySubscriptionCreateRequestEventType.fromJSON(json.event_type) else return null;
            let ?filter = ActivitySubscriptionFilter.fromJSON(json.filter) else return null;
            ?{ json with
                event_type;
                filter;
            }
        };
    }
}
