/// Response from finalizing a Chat media upload.

import { type ChatMediaUploadFinalizeResponseData; JSON = ChatMediaUploadFinalizeResponseData } "./ChatMediaUploadFinalizeResponseData";

// ChatMediaUploadFinalizeResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadFinalizeResponse = {
        data : ?ChatMediaUploadFinalizeResponseData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadFinalizeResponse type
        public type JSON = {
            data : ?ChatMediaUploadFinalizeResponseData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadFinalizeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadFinalizeResponse = ?json;
    }
}
