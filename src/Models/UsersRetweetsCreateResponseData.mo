
// UsersRetweetsCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type UsersRetweetsCreateResponseData = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        retweeted : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersRetweetsCreateResponseData type
        public type JSON = {
            id : ?Text;
            retweeted : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersRetweetsCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersRetweetsCreateResponseData = ?json;
    }
}
