
import { type UsageFields; JSON = UsageFields } "./UsageFields";

// ClientAppUsage.mo
/// Usage per client app

module {
    // User-facing type: what application code uses
    public type ClientAppUsage = {
        /// The unique identifier for this project
        client_app_id : ?Text;
        /// The usage value
        usage : ?[UsageFields];
        /// The number of results returned
        usage_result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ClientAppUsage type
        public type JSON = {
            client_app_id : ?Text;
            usage : ?[UsageFields];
            usage_result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ClientAppUsage) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ClientAppUsage = ?json;
    }
}
