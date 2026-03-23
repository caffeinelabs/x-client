
import { type Problem; JSON = Problem } "./Problem";

import { type PublicKey; JSON = PublicKey } "./PublicKey";

// Get2UsersIdPublicKeysResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersIdPublicKeysResponse = {
        data : ?[PublicKey];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersIdPublicKeysResponse type
        public type JSON = {
            data : ?[PublicKey];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersIdPublicKeysResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersIdPublicKeysResponse = ?json;
    }
}
