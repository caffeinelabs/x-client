
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";

// TweetUnviewable.mo

module {
    // User-facing type: what application code uses
    public type TweetUnviewable = {
        /// If the label is being applied or removed. Possible values are ‘apply’ or ‘remove’.
        application : Text;
        /// Event time.
        event_at : Text;
        tweet : TweetComplianceSchemaTweet;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetUnviewable type
        public type JSON = {
            application : Text;
            event_at : Text;
            tweet : TweetComplianceSchemaTweet;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetUnviewable) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetUnviewable = ?json;
    }
}
