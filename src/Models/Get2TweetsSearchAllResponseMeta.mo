
// Get2TweetsSearchAllResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsSearchAllResponseMeta = {
        /// The newest id in this response.
        newest_id : ?Text;
        /// The next token.
        next_token : ?Text;
        /// The oldest id in this response.
        oldest_id : ?Text;
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsSearchAllResponseMeta type
        public type JSON = {
            newest_id : ?Text;
            next_token : ?Text;
            oldest_id : ?Text;
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsSearchAllResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsSearchAllResponseMeta = ?json;
    }
}
