
// ManagementInfo.mo

module {
    // User-facing type: what application code uses
    public type ManagementInfo = {
        /// Indicates if the media is managed by Media Studio
        managed : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ManagementInfo type
        public type JSON = {
            managed : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ManagementInfo) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ManagementInfo = ?json;
    }
}
