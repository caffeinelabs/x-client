
import { type Problem; JSON = Problem } "./Problem";

import { type PublicKey; JSON = PublicKey } "./PublicKey";

// Get2UsersPublicKeysResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersPublicKeysResponse = {
        data : ?PublicKey;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersPublicKeysResponse type
        public type JSON = {
            data : ?PublicKey;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersPublicKeysResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersPublicKeysResponse = ?json;
    }
}
