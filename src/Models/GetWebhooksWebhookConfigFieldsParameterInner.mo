
// GetWebhooksWebhookConfigFieldsParameterInner.mo
/// Enum values: #created_at, #id, #url, #valid

module {
    // User-facing type: type-safe variants for application code
    public type GetWebhooksWebhookConfigFieldsParameterInner = {
        #created_at;
        #id;
        #url;
        #valid;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetWebhooksWebhookConfigFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetWebhooksWebhookConfigFieldsParameterInner) : JSON =
            switch (value) {
                case (#created_at) "created_at";
                case (#id) "id";
                case (#url) "url";
                case (#valid) "valid";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetWebhooksWebhookConfigFieldsParameterInner =
            switch (json) {
                case "created_at" ?#created_at;
                case "id" ?#id;
                case "url" ?#url;
                case "valid" ?#valid;
                case _ null;
            };
    }
}
