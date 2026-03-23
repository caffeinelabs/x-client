
import { type Problem; JSON = Problem } "./Problem";

// UnsupportedAuthenticationProblem.mo
/// A problem that indicates that the authentication used is not supported.

module {
    // User-facing type: what application code uses
    public type UnsupportedAuthenticationProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UnsupportedAuthenticationProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UnsupportedAuthenticationProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UnsupportedAuthenticationProblem = ?json;
    }
}
