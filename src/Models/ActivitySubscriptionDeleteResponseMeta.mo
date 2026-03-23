
// ActivitySubscriptionDeleteResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionDeleteResponseMeta = {
        /// Number of active subscriptions remaining.
        total_subscriptions : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionDeleteResponseMeta type
        public type JSON = {
            total_subscriptions : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionDeleteResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionDeleteResponseMeta = ?json;
    }
}
