
// Get2ChatConversationsIdResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type Get2ChatConversationsIdResponseMeta = {
        /// The next token.
        next_token : ?Text;
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2ChatConversationsIdResponseMeta type
        public type JSON = {
            next_token : ?Text;
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2ChatConversationsIdResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2ChatConversationsIdResponseMeta = ?json;
    }
}
