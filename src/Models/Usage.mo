/// Usage per client app

import { type ClientAppUsage; JSON = ClientAppUsage } "./ClientAppUsage";

import { type UsageDailyProjectUsage; JSON = UsageDailyProjectUsage } "./UsageDailyProjectUsage";

// Usage.mo

module {
    // User-facing type: what application code uses
    public type Usage = {
        /// Number of days left for the Tweet cap to reset
        cap_reset_day : ?Int;
        /// The daily usage breakdown for each Client Application a project
        daily_client_app_usage : ?[ClientAppUsage];
        daily_project_usage : ?UsageDailyProjectUsage;
        /// Total number of Posts that can be read in this project per month
        project_cap : ?Int;
        /// The unique identifier for this project
        project_id : ?Text;
        /// The number of Posts read in this project
        project_usage : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Usage type
        public type JSON = {
            cap_reset_day : ?Int;
            daily_client_app_usage : ?[ClientAppUsage];
            daily_project_usage : ?UsageDailyProjectUsage;
            project_cap : ?Int;
            project_id : ?Text;
            project_usage : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Usage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Usage = ?json;
    }
}
