
// GetInsights28HrEngagementFieldsParameterInner.mo
/// Enum values: #errors, #measurement

module {
    // User-facing type: type-safe variants for application code
    public type GetInsights28HrEngagementFieldsParameterInner = {
        #errors;
        #measurement;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetInsights28HrEngagementFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetInsights28HrEngagementFieldsParameterInner) : JSON =
            switch (value) {
                case (#errors) "errors";
                case (#measurement) "measurement";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetInsights28HrEngagementFieldsParameterInner =
            switch (json) {
                case "errors" ?#errors;
                case "measurement" ?#measurement;
                case _ null;
            };
    }
}
