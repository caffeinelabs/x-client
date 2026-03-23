
// ActivitySubscriptionDeleteResponseData.mo

module {
    // User-facing type: what application code uses
    public type ActivitySubscriptionDeleteResponseData = {
        deleted : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivitySubscriptionDeleteResponseData type
        public type JSON = {
            deleted : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivitySubscriptionDeleteResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivitySubscriptionDeleteResponseData = ?json;
    }
}
