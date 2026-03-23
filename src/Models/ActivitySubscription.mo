
import { type ActivitySubscriptionFilter; JSON = ActivitySubscriptionFilter } "./ActivitySubscriptionFilter";

// ActivitySubscription.mo
/// An XActivity subscription.

module {
    // User-facing type: what application code uses
    public type ActivitySubscription = {
        created_at : Text;
        event_type : Text;
        filter : ActivitySubscriptionFilter;
        /// The unique identifier of this subscription.
        subscription_id : Text;
        tag : ?Text;
        updated_at : Text;
        /// The unique identifier of this webhook config.
        webhook_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscription type
        public type JSON = {
            created_at : Text;
            event_type : Text;
            filter : ActivitySubscriptionFilter.JSON;
            subscription_id : Text;
            tag : ?Text;
            updated_at : Text;
            webhook_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscription) : JSON = { value with
            filter = ActivitySubscriptionFilter.toJSON(value.filter);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscription {
            let ?filter = ActivitySubscriptionFilter.fromJSON(json.filter) else return null;
            ?{ json with
                filter;
            }
        };
    }
}
