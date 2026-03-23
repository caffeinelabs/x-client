
// SubscriptionsCountGetResponseData.mo
/// The count of active subscriptions across all webhooks

module {
    // User-facing type: what application code uses
    public type SubscriptionsCountGetResponseData = {
        /// The account name
        account_name : Text;
        /// The limit for subscriptions for this app
        provisioned_count : Text;
        /// The number of active subscriptions across all webhooks
        subscriptions_count_all : Text;
        /// The number of active direct message subscriptions
        subscriptions_count_direct_messages : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsCountGetResponseData type
        public type JSON = {
            account_name : Text;
            provisioned_count : Text;
            subscriptions_count_all : Text;
            subscriptions_count_direct_messages : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsCountGetResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsCountGetResponseData = ?json;
    }
}
