
import { type Media; JSON = Media } "./Media";

import { type Problem; JSON = Problem } "./Problem";

// Get2MediaMediaKeyResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2MediaMediaKeyResponse = {
        data : ?Media;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2MediaMediaKeyResponse type
        public type JSON = {
            data : ?Media;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2MediaMediaKeyResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2MediaMediaKeyResponse = ?json;
    }
}
