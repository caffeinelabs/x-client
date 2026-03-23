
// MuteUserMutationResponseData.mo

module {
    // User-facing type: what application code uses
    public type MuteUserMutationResponseData = {
        muting : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MuteUserMutationResponseData type
        public type JSON = {
            muting : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MuteUserMutationResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MuteUserMutationResponseData = ?json;
    }
}
