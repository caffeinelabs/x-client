
import { type ChatPublicKey; JSON = ChatPublicKey } "./ChatPublicKey";

import { type Problem; JSON = Problem } "./Problem";

// ChatAddPublicKeyResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatAddPublicKeyResponse = {
        data : ?ChatPublicKey;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatAddPublicKeyResponse type
        public type JSON = {
            data : ?ChatPublicKey;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatAddPublicKeyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatAddPublicKeyResponse = ?json;
    }
}
