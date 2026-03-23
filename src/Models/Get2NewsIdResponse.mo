
import { type News; JSON = News } "./News";

import { type Problem; JSON = Problem } "./Problem";

// Get2NewsIdResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2NewsIdResponse = {
        data : ?News;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2NewsIdResponse type
        public type JSON = {
            data : ?News;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2NewsIdResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2NewsIdResponse = ?json;
    }
}
