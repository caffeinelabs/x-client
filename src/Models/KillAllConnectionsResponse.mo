
import { type KillAllConnectionsResponseData; JSON = KillAllConnectionsResponseData } "./KillAllConnectionsResponseData";

import { type Problem; JSON = Problem } "./Problem";

// KillAllConnectionsResponse.mo

module {
    // User-facing type: what application code uses
    public type KillAllConnectionsResponse = {
        data : ?KillAllConnectionsResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer KillAllConnectionsResponse type
        public type JSON = {
            data : ?KillAllConnectionsResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : KillAllConnectionsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?KillAllConnectionsResponse = ?json;
    }
}
