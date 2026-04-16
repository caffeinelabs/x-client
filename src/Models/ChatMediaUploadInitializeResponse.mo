/// Response from initializing a Chat media upload.

import { type ChatMediaUploadInitializeResponseData; JSON = ChatMediaUploadInitializeResponseData } "./ChatMediaUploadInitializeResponseData";

// ChatMediaUploadInitializeResponse.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadInitializeResponse = {
        data : ?ChatMediaUploadInitializeResponseData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadInitializeResponse type
        public type JSON = {
            data : ?ChatMediaUploadInitializeResponseData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadInitializeResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadInitializeResponse = ?json;
    }
}
