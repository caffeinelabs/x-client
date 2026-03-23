
// MediaUploadAppendResponseData.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadAppendResponseData = {
        /// Unix epoch time in seconds after when the upload session expires.
        expires_at : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadAppendResponseData type
        public type JSON = {
            expires_at : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadAppendResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadAppendResponseData = ?json;
    }
}
