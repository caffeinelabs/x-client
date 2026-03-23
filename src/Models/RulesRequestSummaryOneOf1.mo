
// RulesRequestSummaryOneOf1.mo

module {
    // User-facing type: what application code uses
    public type RulesRequestSummaryOneOf1 = {
        /// Number of user-specified stream filtering rules that were deleted.
        deleted : Int;
        /// Number of user-specified stream filtering rules that were not deleted.
        not_deleted : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesRequestSummaryOneOf1 type
        public type JSON = {
            deleted : Int;
            not_deleted : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesRequestSummaryOneOf1) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesRequestSummaryOneOf1 = ?json;
    }
}
