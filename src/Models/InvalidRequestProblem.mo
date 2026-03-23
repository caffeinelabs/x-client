
import { type InvalidRequestProblemAllOfErrors; JSON = InvalidRequestProblemAllOfErrors } "./InvalidRequestProblemAllOfErrors";

import { type Problem; JSON = Problem } "./Problem";

// InvalidRequestProblem.mo
/// A problem that indicates this request is invalid.

module {
    // User-facing type: what application code uses
    public type InvalidRequestProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        errors : ?[InvalidRequestProblemAllOfErrors];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer InvalidRequestProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            errors : ?[InvalidRequestProblemAllOfErrors];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : InvalidRequestProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?InvalidRequestProblem = ?json;
    }
}
