
// ChatSendTypingIndicatorResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatSendTypingIndicatorResponseData = {
        /// Whether the typing indicator was sent successfully.
        success : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatSendTypingIndicatorResponseData type
        public type JSON = {
            success : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatSendTypingIndicatorResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatSendTypingIndicatorResponseData = ?json;
    }
}
