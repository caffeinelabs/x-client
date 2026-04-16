/// The rule you have submitted is invalid.

import { type Problem; JSON = Problem } "./Problem";

// InvalidRuleProblem.mo

module {
    // User-facing type: what application code uses
    public type InvalidRuleProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer InvalidRuleProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : InvalidRuleProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?InvalidRuleProblem = ?json;
    }
}
