/// Shows who can reply a Tweet. Fields returned are everyone, mentioned_users, and following.

// ReplySettings.mo
/// Enum values: #everyone, #mentionedusers, #following, #other

module {
    // User-facing type: type-safe variants for application code
    public type ReplySettings = {
        #everyone;
        #mentionedusers;
        #following;
        #other;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ReplySettings type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ReplySettings) : JSON =
            switch (value) {
                case (#everyone) "everyone";
                case (#mentionedusers) "mentionedUsers";
                case (#following) "following";
                case (#other) "other";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ReplySettings =
            switch (json) {
                case "everyone" ?#everyone;
                case "mentionedUsers" ?#mentionedusers;
                case "following" ?#following;
                case "other" ?#other;
                case _ null;
            };
    }
}
