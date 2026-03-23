
import { type ActivitySubscription; JSON = ActivitySubscription } "./ActivitySubscription";

// ActivitySubscriptionUpdateResponseData.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionUpdateResponseData = {
        subscription : ?ActivitySubscription;
        /// Number of active subscriptions.
        total_subscriptions : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionUpdateResponseData type
        public type JSON = {
            subscription : ?ActivitySubscription.JSON;
            total_subscriptions : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionUpdateResponseData) : JSON = { value with
            subscription = do ? { ActivitySubscription.toJSON(value.subscription!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionUpdateResponseData {
            ?{ json with
                subscription = do ? { ActivitySubscription.fromJSON(json.subscription!)! };
            }
        };
    }
}
