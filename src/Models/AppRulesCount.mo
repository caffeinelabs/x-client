
// AppRulesCount.mo
/// A count of user-provided stream filtering rules at the client application level.

module {
    // User-facing type: what application code uses
    public type AppRulesCount = {
        /// The ID of the client application
        client_app_id : ?Text;
        /// Number of rules for client application
        rule_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AppRulesCount type
        public type JSON = {
            client_app_id : ?Text;
            rule_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AppRulesCount) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AppRulesCount = ?json;
    }
}
