
// ChatMediaUploadFinalizeResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadFinalizeResponseData = {
        /// Whether the finalize request succeeded.
        success : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadFinalizeResponseData type
        public type JSON = {
            success : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadFinalizeResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadFinalizeResponseData = ?json;
    }
}
