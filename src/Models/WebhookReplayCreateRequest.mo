
// WebhookReplayCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type WebhookReplayCreateRequest = {
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        from_date : Text;
        /// The oldest (starting) UTC timestamp (inclusive) from which events will be provided, in yyyymmddhhmm format.
        to_date : Text;
        /// The unique identifier of this webhook config.
        webhook_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookReplayCreateRequest type
        public type JSON = {
            from_date : Text;
            to_date : Text;
            webhook_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookReplayCreateRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookReplayCreateRequest = ?json;
    }
}
