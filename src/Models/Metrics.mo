
// Metrics.mo

module {
    // User-facing type: what application code uses
    public type Metrics = {
        /// Tracks number of App Install Attempts
        app_install_attempts : ?Int;
        /// Tracks number of App opens
        app_opens : ?Int;
        /// Tracks number of Detail expands
        detail_expands : ?Int;
        /// Tracks number of Email Tweet actions
        email_tweet : ?Int;
        /// Tracks total Engagements
        engagements : ?Int;
        /// Tracks number of Follows
        follows : ?Int;
        /// Tracks number of Hashtag clicks
        hashtag_clicks : ?Int;
        /// Tracks number of Impressions
        impressions : ?Int;
        /// Tracks number of Likes
        likes : ?Int;
        /// Tracks number of Link clicks
        link_clicks : ?Int;
        /// Tracks number of Media engagements
        media_engagements : ?Int;
        /// Tracks number of Media views
        media_views : ?Int;
        /// Tracks number of Permalink clicks
        permalink_clicks : ?Int;
        /// Tracks number of Profile visits
        profile_visits : ?Int;
        /// Tracks number of Quote Tweets
        quote_tweets : ?Int;
        /// Tracks number of Replies
        replies : ?Int;
        /// Tracks number of Retweets
        retweets : ?Int;
        /// Tracks number of URL clicks
        url_clicks : ?Int;
        /// Tracks number of User Profile clicks
        user_profile_clicks : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Metrics type
        public type JSON = {
            app_install_attempts : ?Int;
            app_opens : ?Int;
            detail_expands : ?Int;
            email_tweet : ?Int;
            engagements : ?Int;
            follows : ?Int;
            hashtag_clicks : ?Int;
            impressions : ?Int;
            likes : ?Int;
            link_clicks : ?Int;
            media_engagements : ?Int;
            media_views : ?Int;
            permalink_clicks : ?Int;
            profile_visits : ?Int;
            quote_tweets : ?Int;
            replies : ?Int;
            retweets : ?Int;
            url_clicks : ?Int;
            user_profile_clicks : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Metrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Metrics = ?json;
    }
}
