
// ChatGetConversationsResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ChatGetConversationsResponseMeta = {
        /// Whether the user has pending message requests.
        has_message_requests : ?Bool;
        /// Whether there are more conversations to fetch.
        has_more : ?Bool;
        /// Token to retrieve the next page of results.
        next_token : ?Text;
        /// The number of conversations returned.
        result_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatGetConversationsResponseMeta type
        public type JSON = {
            has_message_requests : ?Bool;
            has_more : ?Bool;
            next_token : ?Text;
            result_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatGetConversationsResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatGetConversationsResponseMeta = ?json;
    }
}
