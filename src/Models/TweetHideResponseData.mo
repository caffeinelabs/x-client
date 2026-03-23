
// TweetHideResponseData.mo

module {
    // User-facing type: what application code uses
    public type TweetHideResponseData = {
        hidden : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetHideResponseData type
        public type JSON = {
            hidden : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetHideResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetHideResponseData = ?json;
    }
}
