
// RulesRequestSummaryOneOf.mo
/// A summary of the results of the addition of user-specified stream filtering rules.

module {
    // User-facing type: what application code uses
    public type RulesRequestSummaryOneOf = {
        /// Number of user-specified stream filtering rules that were created.
        created : Int;
        /// Number of invalid user-specified stream filtering rules.
        invalid : Int;
        /// Number of user-specified stream filtering rules that were not created.
        not_created : Int;
        /// Number of valid user-specified stream filtering rules.
        valid : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesRequestSummaryOneOf type
        public type JSON = {
            created : Int;
            invalid : Int;
            not_created : Int;
            valid : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesRequestSummaryOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesRequestSummaryOneOf = ?json;
    }
}
