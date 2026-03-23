
import { type Problem; JSON = Problem } "./Problem";

import { type UsersDMBlockCreateResponseData; JSON = UsersDMBlockCreateResponseData } "./UsersDMBlockCreateResponseData";

// UsersDMUnBlockCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type UsersDMUnBlockCreateResponse = {
        data : ?UsersDMBlockCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersDMUnBlockCreateResponse type
        public type JSON = {
            data : ?UsersDMBlockCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersDMUnBlockCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersDMUnBlockCreateResponse = ?json;
    }
}
