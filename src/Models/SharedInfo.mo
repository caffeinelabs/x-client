
// SharedInfo.mo

module {
    // User-facing type: what application code uses
    public type SharedInfo = {
        /// Indicates if the media is shared in direct messages
        shared_ : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SharedInfo type
        public type JSON = {
            shared_ : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SharedInfo) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SharedInfo = ?json;
    }
}
