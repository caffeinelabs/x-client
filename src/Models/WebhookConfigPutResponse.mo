
import { type Problem; JSON = Problem } "./Problem";

import { type WebhookConfigPutResponseData; JSON = WebhookConfigPutResponseData } "./WebhookConfigPutResponseData";

// WebhookConfigPutResponse.mo

module {
    // User-facing type: what application code uses
    public type WebhookConfigPutResponse = {
        data : ?WebhookConfigPutResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WebhookConfigPutResponse type
        public type JSON = {
            data : ?WebhookConfigPutResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WebhookConfigPutResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WebhookConfigPutResponse = ?json;
    }
}
