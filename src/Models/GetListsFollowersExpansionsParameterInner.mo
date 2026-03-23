
// GetListsFollowersExpansionsParameterInner.mo
/// Enum values: #affiliation_user_id, #most_recent_tweet_id, #pinned_tweet_id

module {
    // User-facing type: type-safe variants for application code
    public type GetListsFollowersExpansionsParameterInner = {
        #affiliation_user_id;
        #most_recent_tweet_id;
        #pinned_tweet_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsFollowersExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsFollowersExpansionsParameterInner) : JSON =
            switch (value) {
                case (#affiliation_user_id) "affiliation.user_id";
                case (#most_recent_tweet_id) "most_recent_tweet_id";
                case (#pinned_tweet_id) "pinned_tweet_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsFollowersExpansionsParameterInner =
            switch (json) {
                case "affiliation.user_id" ?#affiliation_user_id;
                case "most_recent_tweet_id" ?#most_recent_tweet_id;
                case "pinned_tweet_id" ?#pinned_tweet_id;
                case _ null;
            };
    }
}
