
// TweetReferencedTweetsInnerType.mo
/// Enum values: #retweeted, #quoted, #replied_to

module {
    // User-facing type: type-safe variants for application code
    public type TweetReferencedTweetsInnerType = {
        #retweeted;
        #quoted;
        #replied_to;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetReferencedTweetsInnerType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetReferencedTweetsInnerType) : JSON =
            switch (value) {
                case (#retweeted) "retweeted";
                case (#quoted) "quoted";
                case (#replied_to) "replied_to";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetReferencedTweetsInnerType =
            switch (json) {
                case "retweeted" ?#retweeted;
                case "quoted" ?#quoted;
                case "replied_to" ?#replied_to;
                case _ null;
            };
    }
}
