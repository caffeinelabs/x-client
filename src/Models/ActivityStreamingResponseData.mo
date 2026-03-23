
import { type ActivityStreamingResponsePayload; JSON = ActivityStreamingResponsePayload } "./ActivityStreamingResponsePayload";

import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";

// ActivityStreamingResponseData.mo

module {
    // User-facing type: what application code uses
    public type ActivityStreamingResponseData = {
        event_type : ?Text;
        /// The unique identifier of an Activity event.
        event_uuid : ?Text;
        filter : ?ActivitySubscriptionFilter;
        payload : ?ActivityStreamingResponsePayload;
        tag : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivityStreamingResponseData type
        public type JSON = {
            event_type : ?Text;
            event_uuid : ?Text;
            filter : ?ActivitySubscriptionFilter.JSON;
            payload : ?ActivityStreamingResponsePayload.JSON;
            tag : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivityStreamingResponseData) : JSON = { value with
            filter = do ? { ActivitySubscriptionFilter.toJSON(value.filter!) };
            payload = do ? { ActivityStreamingResponsePayload.toJSON(value.payload!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivityStreamingResponseData {
            ?{ json with
                filter = do ? { ActivitySubscriptionFilter.fromJSON(json.filter!)! };
                payload = do ? { ActivityStreamingResponsePayload.fromJSON(json.payload!)! };
            }
        };
    }
}
