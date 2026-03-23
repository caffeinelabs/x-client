
import { type KillAllConnectionsResponseData; JSON = KillAllConnectionsResponseData } "./KillAllConnectionsResponseData";

import { type Problem; JSON = Problem } "./Problem";

// KillConnectionsByEndpointResponse.mo

module {
    // User-facing type: what application code uses
    public type KillConnectionsByEndpointResponse = {
        data : ?KillAllConnectionsResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer KillConnectionsByEndpointResponse type
        public type JSON = {
            data : ?KillAllConnectionsResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : KillConnectionsByEndpointResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?KillConnectionsByEndpointResponse = ?json;
    }
}
