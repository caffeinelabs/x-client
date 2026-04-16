/// The list of active subscriptions for a specified webhook

import { type SubscriptionsListGetResponseDataSubscriptionsInner; JSON = SubscriptionsListGetResponseDataSubscriptionsInner } "./SubscriptionsListGetResponseDataSubscriptionsInner";

// SubscriptionsListGetResponseData.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsListGetResponseData = {
        /// The application ID
        application_id : Text;
        /// List of active subscriptions for the webhook
        subscriptions : [SubscriptionsListGetResponseDataSubscriptionsInner];
        /// The associated webhook ID
        webhook_id : Text;
        /// The url for the associated webhook
        webhook_url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsListGetResponseData type
        public type JSON = {
            application_id : Text;
            subscriptions : [SubscriptionsListGetResponseDataSubscriptionsInner];
            webhook_id : Text;
            webhook_url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsListGetResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsListGetResponseData = ?json;
    }
}
