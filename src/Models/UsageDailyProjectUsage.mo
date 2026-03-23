
import { type UsageFields; JSON = UsageFields } "./UsageFields";

// UsageDailyProjectUsage.mo
/// The daily usage breakdown for a project

module {
    // User-facing type: what application code uses
    public type UsageDailyProjectUsage = {
        /// The unique identifier for this project
        project_id : ?Int;
        /// The usage value
        usage : ?[UsageFields];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageDailyProjectUsage type
        public type JSON = {
            project_id : ?Int;
            usage : ?[UsageFields];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageDailyProjectUsage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageDailyProjectUsage = ?json;
    }
}
