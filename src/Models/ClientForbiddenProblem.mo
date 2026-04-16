/// A problem that indicates your client is forbidden from making this request.

import { type ClientForbiddenProblemAllOfReason; JSON = ClientForbiddenProblemAllOfReason } "./ClientForbiddenProblemAllOfReason";

import { type Problem; JSON = Problem } "./Problem";

// ClientForbiddenProblem.mo

module {
    // User-facing type: what application code uses
    public type ClientForbiddenProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        reason : ?ClientForbiddenProblemAllOfReason;
        registration_url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ClientForbiddenProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            reason : ?ClientForbiddenProblemAllOfReason.JSON;
            registration_url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ClientForbiddenProblem) : JSON = { value with
            reason = do ? { ClientForbiddenProblemAllOfReason.toJSON(value.reason!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ClientForbiddenProblem {
            ?{ json with
                reason = do ? { ClientForbiddenProblemAllOfReason.fromJSON(json.reason!)! };
            }
        };
    }
}
