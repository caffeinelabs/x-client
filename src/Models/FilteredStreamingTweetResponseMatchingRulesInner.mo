
// FilteredStreamingTweetResponseMatchingRulesInner.mo

module {
    // User-facing type: what application code uses
    public type FilteredStreamingTweetResponseMatchingRulesInner = {
        /// Unique identifier of this rule.
        id : Text;
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FilteredStreamingTweetResponseMatchingRulesInner type
        public type JSON = {
            id : Text;
            tag : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FilteredStreamingTweetResponseMatchingRulesInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FilteredStreamingTweetResponseMatchingRulesInner = ?json;
    }
}
