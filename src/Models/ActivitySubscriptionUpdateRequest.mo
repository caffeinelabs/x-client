
// ActivitySubscriptionUpdateRequest.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionUpdateRequest = {
        tag : ?Text;
        /// The unique identifier of this webhook config.
        webhook_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionUpdateRequest type
        public type JSON = {
            tag : ?Text;
            webhook_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionUpdateRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionUpdateRequest = ?json;
    }
}
