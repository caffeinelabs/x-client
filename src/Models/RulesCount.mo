
import { type AppRulesCount; JSON = AppRulesCount } "./AppRulesCount";

// RulesCount.mo
/// A count of user-provided stream filtering rules at the application and project levels.

module {
    // User-facing type: what application code uses
    public type RulesCount = {
        /// Client App Rule Counts for all applications in the project
        all_project_client_apps : ?[AppRulesCount];
        /// Cap of number of rules allowed per client application
        cap_per_client_app : ?Int;
        /// Cap of number of rules allowed per project
        cap_per_project : ?Int;
        client_app_rules_count : ?AppRulesCount;
        /// Number of rules for project
        project_rules_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesCount type
        public type JSON = {
            all_project_client_apps : ?[AppRulesCount];
            cap_per_client_app : ?Int;
            cap_per_project : ?Int;
            client_app_rules_count : ?AppRulesCount;
            project_rules_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesCount) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesCount = ?json;
    }
}
