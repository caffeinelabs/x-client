
// WebhookConfigCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type WebhookConfigCreateRequest = {
        url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookConfigCreateRequest type
        public type JSON = {
            url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookConfigCreateRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookConfigCreateRequest = ?json;
    }
}
