
import { type ActivitySubscription; JSON = ActivitySubscription } "./ActivitySubscription";

// ActivitySubscriptionCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionCreateResponseData = {
        subscription : ?ActivitySubscription;
        total_subscriptions_for_instance_id : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionCreateResponseData type
        public type JSON = {
            subscription : ?ActivitySubscription.JSON;
            total_subscriptions_for_instance_id : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionCreateResponseData) : JSON = { value with
            subscription = do ? { ActivitySubscription.toJSON(value.subscription!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionCreateResponseData {
            ?{ json with
                subscription = do ? { ActivitySubscription.fromJSON(json.subscription!)! };
            }
        };
    }
}
