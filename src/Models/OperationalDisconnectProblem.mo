
import { type OperationalDisconnectProblemAllOfDisconnectType; JSON = OperationalDisconnectProblemAllOfDisconnectType } "./OperationalDisconnectProblemAllOfDisconnectType";

import { type Problem; JSON = Problem } "./Problem";

// OperationalDisconnectProblem.mo
/// You have been disconnected for operational reasons.

module {
    // User-facing type: what application code uses
    public type OperationalDisconnectProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        disconnect_type : ?OperationalDisconnectProblemAllOfDisconnectType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer OperationalDisconnectProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            disconnect_type : ?OperationalDisconnectProblemAllOfDisconnectType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : OperationalDisconnectProblem) : JSON = { value with
            disconnect_type = do ? { OperationalDisconnectProblemAllOfDisconnectType.toJSON(value.disconnect_type!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?OperationalDisconnectProblem {
            ?{ json with
                disconnect_type = do ? { OperationalDisconnectProblemAllOfDisconnectType.fromJSON(json.disconnect_type!)! };
            }
        };
    }
}
