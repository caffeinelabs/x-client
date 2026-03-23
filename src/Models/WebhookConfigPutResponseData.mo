
// WebhookConfigPutResponseData.mo

module {
    // User-facing type: what application code uses
    public type WebhookConfigPutResponseData = {
        attempted : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookConfigPutResponseData type
        public type JSON = {
            attempted : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookConfigPutResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookConfigPutResponseData = ?json;
    }
}
