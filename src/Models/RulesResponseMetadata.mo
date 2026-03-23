
import { type RulesRequestSummary; JSON = RulesRequestSummary } "./RulesRequestSummary";

// RulesResponseMetadata.mo

module {
    // User-facing type: what application code uses
    public type RulesResponseMetadata = {
        /// The next token.
        next_token : ?Text;
        /// Number of Rules in result set.
        result_count : ?Int;
        sent : Text;
        summary : ?RulesRequestSummary;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesResponseMetadata type
        public type JSON = {
            next_token : ?Text;
            result_count : ?Int;
            sent : Text;
            summary : ?RulesRequestSummary;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesResponseMetadata) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesResponseMetadata = ?json;
    }
}
