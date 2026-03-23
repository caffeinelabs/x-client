
// GetRuleCountsRulesCountFieldsParameterInner.mo
/// Enum values: #all_project_client_apps, #cap_per_client_app, #cap_per_project, #client_app_rules_count, #project_rules_count

module {
    // User-facing type: type-safe variants for application code
    public type GetRuleCountsRulesCountFieldsParameterInner = {
        #all_project_client_apps;
        #cap_per_client_app;
        #cap_per_project;
        #client_app_rules_count;
        #project_rules_count;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetRuleCountsRulesCountFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetRuleCountsRulesCountFieldsParameterInner) : JSON =
            switch (value) {
                case (#all_project_client_apps) "all_project_client_apps";
                case (#cap_per_client_app) "cap_per_client_app";
                case (#cap_per_project) "cap_per_project";
                case (#client_app_rules_count) "client_app_rules_count";
                case (#project_rules_count) "project_rules_count";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetRuleCountsRulesCountFieldsParameterInner =
            switch (json) {
                case "all_project_client_apps" ?#all_project_client_apps;
                case "cap_per_client_app" ?#cap_per_client_app;
                case "cap_per_project" ?#cap_per_project;
                case "client_app_rules_count" ?#client_app_rules_count;
                case "project_rules_count" ?#project_rules_count;
                case _ null;
            };
    }
}
