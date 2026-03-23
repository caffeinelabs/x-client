
// GetPostsAnalyticsAnalyticsFieldsParameterInner.mo
/// Enum values: #app_install_attempts, #app_opens, #bookmarks, #detail_expands, #email_tweet, #engagements, #follows, #hashtag_clicks, #id, #impressions, #likes, #media_views, #permalink_clicks, #quote_tweets, #replies, #retweets, #shares, #timestamp, #unfollows, #unlikes, #url_clicks, #user_profile_clicks

module {
    // User-facing type: type-safe variants for application code
    public type GetPostsAnalyticsAnalyticsFieldsParameterInner = {
        #app_install_attempts;
        #app_opens;
        #bookmarks;
        #detail_expands;
        #email_tweet;
        #engagements;
        #follows;
        #hashtag_clicks;
        #id;
        #impressions;
        #likes;
        #media_views;
        #permalink_clicks;
        #quote_tweets;
        #replies;
        #retweets;
        #shares;
        #timestamp;
        #unfollows;
        #unlikes;
        #url_clicks;
        #user_profile_clicks;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetPostsAnalyticsAnalyticsFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetPostsAnalyticsAnalyticsFieldsParameterInner) : JSON =
            switch (value) {
                case (#app_install_attempts) "app_install_attempts";
                case (#app_opens) "app_opens";
                case (#bookmarks) "bookmarks";
                case (#detail_expands) "detail_expands";
                case (#email_tweet) "email_tweet";
                case (#engagements) "engagements";
                case (#follows) "follows";
                case (#hashtag_clicks) "hashtag_clicks";
                case (#id) "id";
                case (#impressions) "impressions";
                case (#likes) "likes";
                case (#media_views) "media_views";
                case (#permalink_clicks) "permalink_clicks";
                case (#quote_tweets) "quote_tweets";
                case (#replies) "replies";
                case (#retweets) "retweets";
                case (#shares) "shares";
                case (#timestamp) "timestamp";
                case (#unfollows) "unfollows";
                case (#unlikes) "unlikes";
                case (#url_clicks) "url_clicks";
                case (#user_profile_clicks) "user_profile_clicks";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetPostsAnalyticsAnalyticsFieldsParameterInner =
            switch (json) {
                case "app_install_attempts" ?#app_install_attempts;
                case "app_opens" ?#app_opens;
                case "bookmarks" ?#bookmarks;
                case "detail_expands" ?#detail_expands;
                case "email_tweet" ?#email_tweet;
                case "engagements" ?#engagements;
                case "follows" ?#follows;
                case "hashtag_clicks" ?#hashtag_clicks;
                case "id" ?#id;
                case "impressions" ?#impressions;
                case "likes" ?#likes;
                case "media_views" ?#media_views;
                case "permalink_clicks" ?#permalink_clicks;
                case "quote_tweets" ?#quote_tweets;
                case "replies" ?#replies;
                case "retweets" ?#retweets;
                case "shares" ?#shares;
                case "timestamp" ?#timestamp;
                case "unfollows" ?#unfollows;
                case "unlikes" ?#unlikes;
                case "url_clicks" ?#url_clicks;
                case "user_profile_clicks" ?#user_profile_clicks;
                case _ null;
            };
    }
}
