/// A user-provided stream filtering rule.

// Rule.mo

module {
    // User-facing type: what application code uses
    public type Rule = {
        /// Unique identifier of this rule.
        id : ?Text;
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
        /// The filterlang value of the rule.
        value : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Rule type
        public type JSON = {
            id : ?Text;
            tag : ?Text;
            value : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Rule) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Rule = ?json;
    }
}
