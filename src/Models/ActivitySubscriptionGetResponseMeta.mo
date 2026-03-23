
// ActivitySubscriptionGetResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionGetResponseMeta = {
        /// Token to retrieve the next page of results.
        next_token : ?Text;
        /// Number of active subscriptions returned in response.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionGetResponseMeta type
        public type JSON = {
            next_token : ?Text;
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionGetResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionGetResponseMeta = ?json;
    }
}
