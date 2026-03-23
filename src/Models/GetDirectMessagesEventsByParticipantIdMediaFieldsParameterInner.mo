
// GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner.mo
/// Enum values: #alt_text, #duration_ms, #height, #media_key, #non_public_metrics, #organic_metrics, #preview_image_url, #promoted_metrics, #public_metrics, #type_, #url, #variants, #width

module {
    // User-facing type: type-safe variants for application code
    public type GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner = {
        #alt_text;
        #duration_ms;
        #height;
        #media_key;
        #non_public_metrics;
        #organic_metrics;
        #preview_image_url;
        #promoted_metrics;
        #public_metrics;
        #type_;
        #url;
        #variants;
        #width;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner) : JSON =
            switch (value) {
                case (#alt_text) "alt_text";
                case (#duration_ms) "duration_ms";
                case (#height) "height";
                case (#media_key) "media_key";
                case (#non_public_metrics) "non_public_metrics";
                case (#organic_metrics) "organic_metrics";
                case (#preview_image_url) "preview_image_url";
                case (#promoted_metrics) "promoted_metrics";
                case (#public_metrics) "public_metrics";
                case (#type_) "type";
                case (#url) "url";
                case (#variants) "variants";
                case (#width) "width";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetDirectMessagesEventsByParticipantIdMediaFieldsParameterInner =
            switch (json) {
                case "alt_text" ?#alt_text;
                case "duration_ms" ?#duration_ms;
                case "height" ?#height;
                case "media_key" ?#media_key;
                case "non_public_metrics" ?#non_public_metrics;
                case "organic_metrics" ?#organic_metrics;
                case "preview_image_url" ?#preview_image_url;
                case "promoted_metrics" ?#promoted_metrics;
                case "public_metrics" ?#public_metrics;
                case "type" ?#type_;
                case "url" ?#url;
                case "variants" ?#variants;
                case "width" ?#width;
                case _ null;
            };
    }
}
