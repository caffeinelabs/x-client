
// SubscriptionsCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type SubscriptionsCreateResponseData = {
        subscribed : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubscriptionsCreateResponseData type
        public type JSON = {
            subscribed : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubscriptionsCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubscriptionsCreateResponseData = ?json;
    }
}
