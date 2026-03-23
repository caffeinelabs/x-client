
// WebhookLinksCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type WebhookLinksCreateResponseData = {
        provisioned : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookLinksCreateResponseData type
        public type JSON = {
            provisioned : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookLinksCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookLinksCreateResponseData = ?json;
    }
}
