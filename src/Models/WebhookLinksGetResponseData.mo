/// The list of active webhook links for a given stream

import { type WebhookLinksGetResponseDataLinksInner; JSON = WebhookLinksGetResponseDataLinksInner } "./WebhookLinksGetResponseDataLinksInner";

// WebhookLinksGetResponseData.mo

module {
    // User-facing type: what application code uses
    public type WebhookLinksGetResponseData = {
        /// list of links
        links : [WebhookLinksGetResponseDataLinksInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookLinksGetResponseData type
        public type JSON = {
            links : [WebhookLinksGetResponseDataLinksInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookLinksGetResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookLinksGetResponseData = ?json;
    }
}
