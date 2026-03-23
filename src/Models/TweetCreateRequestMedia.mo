
// TweetCreateRequestMedia.mo
/// Media information being attached to created Tweet. This is mutually exclusive from Quote Tweet Id, Poll, and Card URI.

module {
    // User-facing type: what application code uses
    public type TweetCreateRequestMedia = {
        /// A list of Media Ids to be attached to a created Tweet.
        media_ids : [Text];
        /// A list of User Ids to be tagged in the media for created Tweet.
        tagged_user_ids : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestMedia type
        public type JSON = {
            media_ids : [Text];
            tagged_user_ids : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestMedia) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestMedia = ?json;
    }
}
