
// Get2UsersSearchResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type Get2UsersSearchResponseMeta = {
        /// The next token.
        next_token : ?Text;
        /// The previous token.
        previous_token : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2UsersSearchResponseMeta type
        public type JSON = {
            next_token : ?Text;
            previous_token : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2UsersSearchResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2UsersSearchResponseMeta = ?json;
    }
}
