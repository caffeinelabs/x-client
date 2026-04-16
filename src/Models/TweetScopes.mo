/// The scopes for this tweet

// TweetScopes.mo

module {
    // User-facing type: what application code uses
    public type TweetScopes = {
        /// Indicates if this Tweet is viewable by followers without the Tweet ID
        followers : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetScopes type
        public type JSON = {
            followers : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetScopes) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetScopes = ?json;
    }
}
