
import { type MediaUploadAppendResponseData; JSON = MediaUploadAppendResponseData } "./MediaUploadAppendResponseData";

import { type Problem; JSON = Problem } "./Problem";

// MediaUploadAppendResponse.mo
/// A response from getting a media upload request status.

module {
    // User-facing type: what application code uses
    public type MediaUploadAppendResponse = {
        data : ?MediaUploadAppendResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadAppendResponse type
        public type JSON = {
            data : ?MediaUploadAppendResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadAppendResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadAppendResponse = ?json;
    }
}
