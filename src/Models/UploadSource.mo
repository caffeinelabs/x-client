
// UploadSource.mo

module {
    // User-facing type: what application code uses
    public type UploadSource = {
        /// Records the source (e.g., app, device) from which the media was uploaded
        upload_source : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UploadSource type
        public type JSON = {
            upload_source : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UploadSource) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UploadSource = ?json;
    }
}
