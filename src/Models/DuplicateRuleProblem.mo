
import { type Problem; JSON = Problem } "./Problem";

// DuplicateRuleProblem.mo
/// The rule you have submitted is a duplicate.

module {
    // User-facing type: what application code uses
    public type DuplicateRuleProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        id : ?Text;
        value : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DuplicateRuleProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            id : ?Text;
            value : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DuplicateRuleProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DuplicateRuleProblem = ?json;
    }
}
