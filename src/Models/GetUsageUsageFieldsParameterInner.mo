
// GetUsageUsageFieldsParameterInner.mo
/// Enum values: #cap_reset_day, #daily_client_app_usage, #daily_project_usage, #project_cap, #project_id, #project_usage

module {
    // User-facing type: type-safe variants for application code
    public type GetUsageUsageFieldsParameterInner = {
        #cap_reset_day;
        #daily_client_app_usage;
        #daily_project_usage;
        #project_cap;
        #project_id;
        #project_usage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetUsageUsageFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetUsageUsageFieldsParameterInner) : JSON =
            switch (value) {
                case (#cap_reset_day) "cap_reset_day";
                case (#daily_client_app_usage) "daily_client_app_usage";
                case (#daily_project_usage) "daily_project_usage";
                case (#project_cap) "project_cap";
                case (#project_id) "project_id";
                case (#project_usage) "project_usage";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetUsageUsageFieldsParameterInner =
            switch (json) {
                case "cap_reset_day" ?#cap_reset_day;
                case "daily_client_app_usage" ?#daily_client_app_usage;
                case "daily_project_usage" ?#daily_project_usage;
                case "project_cap" ?#project_cap;
                case "project_id" ?#project_id;
                case "project_usage" ?#project_usage;
                case _ null;
            };
    }
}
