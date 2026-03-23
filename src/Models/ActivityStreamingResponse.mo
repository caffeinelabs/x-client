
import { type ActivityStreamingResponseData; JSON = ActivityStreamingResponseData } "./ActivityStreamingResponseData";

import { type Problem; JSON = Problem } "./Problem";

// ActivityStreamingResponse.mo
/// An activity event or error that can be returned by the x activity streaming API.

module {
    // User-facing type: what application code uses
    public type ActivityStreamingResponse = {
        data : ?ActivityStreamingResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivityStreamingResponse type
        public type JSON = {
            data : ?ActivityStreamingResponseData.JSON;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivityStreamingResponse) : JSON = { value with
            data = do ? { ActivityStreamingResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivityStreamingResponse {
            ?{ json with
                data = do ? { ActivityStreamingResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
