
// ReplySettingsWithVerifiedUsers.mo
/// Shows who can reply a Tweet. Fields returned are everyone, mentioned_users, subscribers, verified and following.
/// Enum values: #everyone, #mentionedusers, #following, #other, #subscribers, #verified

module {
    // User-facing type: type-safe variants for application code
    public type ReplySettingsWithVerifiedUsers = {
        #everyone;
        #mentionedusers;
        #following;
        #other;
        #subscribers;
        #verified;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ReplySettingsWithVerifiedUsers type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ReplySettingsWithVerifiedUsers) : JSON =
            switch (value) {
                case (#everyone) "everyone";
                case (#mentionedusers) "mentionedUsers";
                case (#following) "following";
                case (#other) "other";
                case (#subscribers) "subscribers";
                case (#verified) "verified";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ReplySettingsWithVerifiedUsers =
            switch (json) {
                case "everyone" ?#everyone;
                case "mentionedUsers" ?#mentionedusers;
                case "following" ?#following;
                case "other" ?#other;
                case "subscribers" ?#subscribers;
                case "verified" ?#verified;
                case _ null;
            };
    }
}
