
// ActivitySubscriptionCreateResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionCreateResponseMeta = {
        /// Number of active subscriptions.
        total_subscriptions : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionCreateResponseMeta type
        public type JSON = {
            total_subscriptions : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionCreateResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionCreateResponseMeta = ?json;
    }
}
