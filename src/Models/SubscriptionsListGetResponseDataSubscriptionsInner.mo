
// SubscriptionsListGetResponseDataSubscriptionsInner.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsListGetResponseDataSubscriptionsInner = {
        /// The ID of the user the webhook is subscribed to
        user_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsListGetResponseDataSubscriptionsInner type
        public type JSON = {
            user_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsListGetResponseDataSubscriptionsInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsListGetResponseDataSubscriptionsInner = ?json;
    }
}
