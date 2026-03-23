
// AllowDownloadStatus.mo

module {
    // User-facing type: what application code uses
    public type AllowDownloadStatus = {
        allow_download : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AllowDownloadStatus type
        public type JSON = {
            allow_download : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AllowDownloadStatus) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AllowDownloadStatus = ?json;
    }
}
