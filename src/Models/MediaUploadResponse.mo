/// A response from getting a media upload request status.

import { type MediaUploadResponseData; JSON = MediaUploadResponseData } "./MediaUploadResponseData";

import { type Problem; JSON = Problem } "./Problem";

// MediaUploadResponse.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadResponse = {
        data : ?MediaUploadResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadResponse type
        public type JSON = {
            data : ?MediaUploadResponseData.JSON;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadResponse) : JSON = { value with
            data = do ? { MediaUploadResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadResponse {
            ?{ json with
                data = do ? { MediaUploadResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
