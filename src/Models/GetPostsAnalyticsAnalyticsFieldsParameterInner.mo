import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetPostsAnalyticsAnalyticsFieldsParameterInner.mo
/// Enum values: #app_install_attempts, #app_opens, #bookmarks, #detail_expands, #email_tweet, #engagements, #follows, #hashtag_clicks, #id, #impressions, #likes, #media_views, #permalink_clicks, #quote_tweets, #replies, #retweets, #shares, #timestamp, #unfollows, #unlikes, #url_clicks, #user_profile_clicks

module {
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

    public module JSON {
        public func toCandidValue(value : GetPostsAnalyticsAnalyticsFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#app_install_attempts) #Text("app_install_attempts");
                case (#app_opens) #Text("app_opens");
                case (#bookmarks) #Text("bookmarks");
                case (#detail_expands) #Text("detail_expands");
                case (#email_tweet) #Text("email_tweet");
                case (#engagements) #Text("engagements");
                case (#follows) #Text("follows");
                case (#hashtag_clicks) #Text("hashtag_clicks");
                case (#id) #Text("id");
                case (#impressions) #Text("impressions");
                case (#likes) #Text("likes");
                case (#media_views) #Text("media_views");
                case (#permalink_clicks) #Text("permalink_clicks");
                case (#quote_tweets) #Text("quote_tweets");
                case (#replies) #Text("replies");
                case (#retweets) #Text("retweets");
                case (#shares) #Text("shares");
                case (#timestamp) #Text("timestamp");
                case (#unfollows) #Text("unfollows");
                case (#unlikes) #Text("unlikes");
                case (#url_clicks) #Text("url_clicks");
                case (#user_profile_clicks) #Text("user_profile_clicks");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetPostsAnalyticsAnalyticsFieldsParameterInner =
            switch (candid) {
                case (#Text("app_install_attempts")) ?#app_install_attempts;
                case (#Text("app_opens")) ?#app_opens;
                case (#Text("bookmarks")) ?#bookmarks;
                case (#Text("detail_expands")) ?#detail_expands;
                case (#Text("email_tweet")) ?#email_tweet;
                case (#Text("engagements")) ?#engagements;
                case (#Text("follows")) ?#follows;
                case (#Text("hashtag_clicks")) ?#hashtag_clicks;
                case (#Text("id")) ?#id;
                case (#Text("impressions")) ?#impressions;
                case (#Text("likes")) ?#likes;
                case (#Text("media_views")) ?#media_views;
                case (#Text("permalink_clicks")) ?#permalink_clicks;
                case (#Text("quote_tweets")) ?#quote_tweets;
                case (#Text("replies")) ?#replies;
                case (#Text("retweets")) ?#retweets;
                case (#Text("shares")) ?#shares;
                case (#Text("timestamp")) ?#timestamp;
                case (#Text("unfollows")) ?#unfollows;
                case (#Text("unlikes")) ?#unlikes;
                case (#Text("url_clicks")) ?#url_clicks;
                case (#Text("user_profile_clicks")) ?#user_profile_clicks;
                case _ null;
            };

        public func toText(value : GetPostsAnalyticsAnalyticsFieldsParameterInner) : Text =
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
    };
};
