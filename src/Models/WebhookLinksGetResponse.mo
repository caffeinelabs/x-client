
import { type Problem; JSON = Problem } "./Problem";

import { type WebhookLinksGetResponseData; JSON = WebhookLinksGetResponseData } "./WebhookLinksGetResponseData";

// WebhookLinksGetResponse.mo

module {
    // User-facing type: what application code uses
    public type WebhookLinksGetResponse = {
        data : ?WebhookLinksGetResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookLinksGetResponse type
        public type JSON = {
            data : ?WebhookLinksGetResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookLinksGetResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookLinksGetResponse = ?json;
    }
}
