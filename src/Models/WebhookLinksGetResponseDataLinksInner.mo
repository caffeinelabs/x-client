
// WebhookLinksGetResponseDataLinksInner.mo

module {
    // User-facing type: what application code uses
    public type WebhookLinksGetResponseDataLinksInner = {
        /// The application ID
        application_id : ?Text;
        /// The user ID
        business_user_id : ?Text;
        /// The datetime the webhook was linked to the stream
        created_at : ?Text;
        /// Requested fields to be rendered
        fields : ?[Text];
        /// The stream ID associated with the FilteredStream instance
        instance_id : ?Text;
        /// The unique identifier for the webhook
        webhook_id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookLinksGetResponseDataLinksInner type
        public type JSON = {
            application_id : ?Text;
            business_user_id : ?Text;
            created_at : ?Text;
            fields : ?[Text];
            instance_id : ?Text;
            webhook_id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookLinksGetResponseDataLinksInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookLinksGetResponseDataLinksInner = ?json;
    }
}
