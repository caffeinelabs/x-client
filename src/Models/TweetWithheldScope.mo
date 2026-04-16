/// Indicates whether the content being withheld is the `tweet` or a `user`.

// TweetWithheldScope.mo
/// Enum values: #tweet, #user

module {
    // User-facing type: type-safe variants for application code
    public type TweetWithheldScope = {
        #tweet;
        #user;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetWithheldScope type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetWithheldScope) : JSON =
            switch (value) {
                case (#tweet) "tweet";
                case (#user) "user";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetWithheldScope =
            switch (json) {
                case "tweet" ?#tweet;
                case "user" ?#user;
                case _ null;
            };
    }
}
