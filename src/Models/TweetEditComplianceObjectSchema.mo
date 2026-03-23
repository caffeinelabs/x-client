
import { type DmEventReferencedTweetsInner; JSON = DmEventReferencedTweetsInner } "./DmEventReferencedTweetsInner";

// TweetEditComplianceObjectSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetEditComplianceObjectSchema = {
        edit_tweet_ids : [Text];
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        initial_tweet_id : Text;
        tweet : DmEventReferencedTweetsInner;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetEditComplianceObjectSchema type
        public type JSON = {
            edit_tweet_ids : [Text];
            event_at : Text;
            initial_tweet_id : Text;
            tweet : DmEventReferencedTweetsInner;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetEditComplianceObjectSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetEditComplianceObjectSchema = ?json;
    }
}
