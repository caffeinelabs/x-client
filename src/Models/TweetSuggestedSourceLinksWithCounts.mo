/// Suggested source links and the number of requests that included each link.

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";

// TweetSuggestedSourceLinksWithCounts.mo

module {
    // User-facing type: what application code uses
    public type TweetSuggestedSourceLinksWithCounts = {
        /// Number of note requests that included the source link.
        count : ?Int;
        url : ?UrlEntity;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetSuggestedSourceLinksWithCounts type
        public type JSON = {
            count : ?Int;
            url : ?UrlEntity;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetSuggestedSourceLinksWithCounts) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetSuggestedSourceLinksWithCounts = ?json;
    }
}
