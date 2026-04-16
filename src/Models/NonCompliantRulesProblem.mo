/// A problem that indicates the user's rule set is not compliant.

import { type Problem; JSON = Problem } "./Problem";

// NonCompliantRulesProblem.mo

module {
    // User-facing type: what application code uses
    public type NonCompliantRulesProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NonCompliantRulesProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NonCompliantRulesProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NonCompliantRulesProblem = ?json;
    }
}
