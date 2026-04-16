/// Settings to indicate who can reply to the Tweet.

// TweetCreateRequestPollReplySettings.mo
/// Enum values: #following, #mentionedusers, #subscribers, #verified

module {
    // User-facing type: type-safe variants for application code
    public type TweetCreateRequestPollReplySettings = {
        #following;
        #mentionedusers;
        #subscribers;
        #verified;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestPollReplySettings type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestPollReplySettings) : JSON =
            switch (value) {
                case (#following) "following";
                case (#mentionedusers) "mentionedUsers";
                case (#subscribers) "subscribers";
                case (#verified) "verified";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestPollReplySettings =
            switch (json) {
                case "following" ?#following;
                case "mentionedUsers" ?#mentionedusers;
                case "subscribers" ?#subscribers;
                case "verified" ?#verified;
                case _ null;
            };
    }
}
