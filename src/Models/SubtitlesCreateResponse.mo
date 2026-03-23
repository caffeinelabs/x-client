
import { type Problem; JSON = Problem } "./Problem";

import { type SubtitlesCreateResponseData; JSON = SubtitlesCreateResponseData } "./SubtitlesCreateResponseData";

// SubtitlesCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type SubtitlesCreateResponse = {
        data : ?SubtitlesCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubtitlesCreateResponse type
        public type JSON = {
            data : ?SubtitlesCreateResponseData.JSON;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubtitlesCreateResponse) : JSON = { value with
            data = do ? { SubtitlesCreateResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubtitlesCreateResponse {
            ?{ json with
                data = do ? { SubtitlesCreateResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
