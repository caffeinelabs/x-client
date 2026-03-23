
import { type TweetNoteTweetEntities; JSON = TweetNoteTweetEntities } "./TweetNoteTweetEntities";

// TweetNoteTweet.mo
/// The full-content of the Tweet, including text beyond 280 characters.

module {
    // User-facing type: what application code uses
    public type TweetNoteTweet = {
        entities : ?TweetNoteTweetEntities;
        /// The note content of the Tweet.
        text_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetNoteTweet type
        public type JSON = {
            entities : ?TweetNoteTweetEntities;
            text_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetNoteTweet) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetNoteTweet = ?json;
    }
}
