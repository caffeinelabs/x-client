
import { type Problem; JSON = Problem } "./Problem";

// GenericProblem.mo
/// A generic problem with no additional information beyond that provided by the HTTP status code.

module {
    // User-facing type: what application code uses
    public type GenericProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GenericProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GenericProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GenericProblem = ?json;
    }
}
