
// DeleteRulesRequestDelete.mo
/// IDs and values of all deleted user-specified stream filtering rules.

module {
    // User-facing type: what application code uses
    public type DeleteRulesRequestDelete = {
        /// IDs of all deleted user-specified stream filtering rules.
        ids : ?[Text];
        /// Values of all deleted user-specified stream filtering rules.
        values : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteRulesRequestDelete type
        public type JSON = {
            ids : ?[Text];
            values : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteRulesRequestDelete) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteRulesRequestDelete = ?json;
    }
}
