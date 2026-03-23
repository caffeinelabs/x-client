
import { type ConnectionExceptionProblemAllOfConnectionIssue; JSON = ConnectionExceptionProblemAllOfConnectionIssue } "./ConnectionExceptionProblemAllOfConnectionIssue";

import { type Problem; JSON = Problem } "./Problem";

// ConnectionExceptionProblem.mo
/// A problem that indicates something is wrong with the connection.

module {
    // User-facing type: what application code uses
    public type ConnectionExceptionProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        connection_issue : ?ConnectionExceptionProblemAllOfConnectionIssue;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConnectionExceptionProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            connection_issue : ?ConnectionExceptionProblemAllOfConnectionIssue.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConnectionExceptionProblem) : JSON = { value with
            connection_issue = do ? { ConnectionExceptionProblemAllOfConnectionIssue.toJSON(value.connection_issue!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConnectionExceptionProblem {
            ?{ json with
                connection_issue = do ? { ConnectionExceptionProblemAllOfConnectionIssue.fromJSON(json.connection_issue!)! };
            }
        };
    }
}
