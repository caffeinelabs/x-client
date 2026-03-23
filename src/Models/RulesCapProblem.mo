
import { type Problem; JSON = Problem } "./Problem";

// RulesCapProblem.mo
/// You have exceeded the maximum number of rules.

module {
    // User-facing type: what application code uses
    public type RulesCapProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesCapProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesCapProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesCapProblem = ?json;
    }
}
