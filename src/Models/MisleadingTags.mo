
// MisleadingTags.mo
/// Community Note misleading tags type.
/// Enum values: #disputed_claim_as_fact, #factual_error, #manipulated_media, #misinterpreted_satire, #missing_important_context, #other, #outdated_information

module {
    // User-facing type: type-safe variants for application code
    public type MisleadingTags = {
        #disputed_claim_as_fact;
        #factual_error;
        #manipulated_media;
        #misinterpreted_satire;
        #missing_important_context;
        #other;
        #outdated_information;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MisleadingTags type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MisleadingTags) : JSON =
            switch (value) {
                case (#disputed_claim_as_fact) "disputed_claim_as_fact";
                case (#factual_error) "factual_error";
                case (#manipulated_media) "manipulated_media";
                case (#misinterpreted_satire) "misinterpreted_satire";
                case (#missing_important_context) "missing_important_context";
                case (#other) "other";
                case (#outdated_information) "outdated_information";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MisleadingTags =
            switch (json) {
                case "disputed_claim_as_fact" ?#disputed_claim_as_fact;
                case "factual_error" ?#factual_error;
                case "manipulated_media" ?#manipulated_media;
                case "misinterpreted_satire" ?#misinterpreted_satire;
                case "missing_important_context" ?#missing_important_context;
                case "other" ?#other;
                case "outdated_information" ?#outdated_information;
                case _ null;
            };
    }
}
