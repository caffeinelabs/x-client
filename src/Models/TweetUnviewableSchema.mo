
import { type TweetUnviewable; JSON = TweetUnviewable } "./TweetUnviewable";

// TweetUnviewableSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetUnviewableSchema = {
        public_tweet_unviewable : TweetUnviewable;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetUnviewableSchema type
        public type JSON = {
            public_tweet_unviewable : TweetUnviewable;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetUnviewableSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetUnviewableSchema = ?json;
    }
}
