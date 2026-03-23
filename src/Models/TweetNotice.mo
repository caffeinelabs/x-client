
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";

// TweetNotice.mo

module {
    // User-facing type: what application code uses
    public type TweetNotice = {
        /// If the label is being applied or removed. Possible values are ‘apply’ or ‘remove’.
        application : Text;
        /// Information shown on the Tweet label
        details : ?Text;
        /// Event time.
        event_at : Text;
        /// The type of label on the Tweet
        event_type : Text;
        /// Link to more information about this kind of label
        extended_details_url : ?Text;
        /// Title/header of the Tweet label
        label_title : ?Text;
        tweet : TweetComplianceSchemaTweet;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetNotice type
        public type JSON = {
            application : Text;
            details : ?Text;
            event_at : Text;
            event_type : Text;
            extended_details_url : ?Text;
            label_title : ?Text;
            tweet : TweetComplianceSchemaTweet;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetNotice) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetNotice = ?json;
    }
}
