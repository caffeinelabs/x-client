/// A Webhook Configuration

// WebhookConfig.mo

module {
    // User-facing type: what application code uses
    public type WebhookConfig = {
        created_at : Text;
        /// The unique identifier of this webhook config.
        id : Text;
        /// The callback URL of the webhook.
        url : Text;
        valid : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookConfig type
        public type JSON = {
            created_at : Text;
            id : Text;
            url : Text;
            valid : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookConfig) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookConfig = ?json;
    }
}
