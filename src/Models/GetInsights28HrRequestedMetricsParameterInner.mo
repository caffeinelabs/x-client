
// GetInsights28HrRequestedMetricsParameterInner.mo
/// Enum values: #appinstallattempts, #appopens, #detailexpands, #emailtweet, #engagements, #follows, #hashtagclicks, #impressions, #likes, #linkclicks, #mediaengagements, #mediaviews, #permalinkclicks, #profilevisits, #quotetweets, #replies, #retweets, #uniquevideoviews, #urlclicks, #userprofileclicks, #videocompletions, #videoplayed25percent, #videoplayed50percent, #videoplayed75percent, #videostarts, #videoviews

module {
    // User-facing type: type-safe variants for application code
    public type GetInsights28HrRequestedMetricsParameterInner = {
        #appinstallattempts;
        #appopens;
        #detailexpands;
        #emailtweet;
        #engagements;
        #follows;
        #hashtagclicks;
        #impressions;
        #likes;
        #linkclicks;
        #mediaengagements;
        #mediaviews;
        #permalinkclicks;
        #profilevisits;
        #quotetweets;
        #replies;
        #retweets;
        #uniquevideoviews;
        #urlclicks;
        #userprofileclicks;
        #videocompletions;
        #videoplayed25percent;
        #videoplayed50percent;
        #videoplayed75percent;
        #videostarts;
        #videoviews;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetInsights28HrRequestedMetricsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetInsights28HrRequestedMetricsParameterInner) : JSON =
            switch (value) {
                case (#appinstallattempts) "AppInstallAttempts";
                case (#appopens) "AppOpens";
                case (#detailexpands) "DetailExpands";
                case (#emailtweet) "EmailTweet";
                case (#engagements) "Engagements";
                case (#follows) "Follows";
                case (#hashtagclicks) "HashtagClicks";
                case (#impressions) "Impressions";
                case (#likes) "Likes";
                case (#linkclicks) "LinkClicks";
                case (#mediaengagements) "MediaEngagements";
                case (#mediaviews) "MediaViews";
                case (#permalinkclicks) "PermalinkClicks";
                case (#profilevisits) "ProfileVisits";
                case (#quotetweets) "QuoteTweets";
                case (#replies) "Replies";
                case (#retweets) "Retweets";
                case (#uniquevideoviews) "UniqueVideoViews";
                case (#urlclicks) "UrlClicks";
                case (#userprofileclicks) "UserProfileClicks";
                case (#videocompletions) "VideoCompletions";
                case (#videoplayed25percent) "VideoPlayed25Percent";
                case (#videoplayed50percent) "VideoPlayed50Percent";
                case (#videoplayed75percent) "VideoPlayed75Percent";
                case (#videostarts) "VideoStarts";
                case (#videoviews) "VideoViews";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetInsights28HrRequestedMetricsParameterInner =
            switch (json) {
                case "AppInstallAttempts" ?#appinstallattempts;
                case "AppOpens" ?#appopens;
                case "DetailExpands" ?#detailexpands;
                case "EmailTweet" ?#emailtweet;
                case "Engagements" ?#engagements;
                case "Follows" ?#follows;
                case "HashtagClicks" ?#hashtagclicks;
                case "Impressions" ?#impressions;
                case "Likes" ?#likes;
                case "LinkClicks" ?#linkclicks;
                case "MediaEngagements" ?#mediaengagements;
                case "MediaViews" ?#mediaviews;
                case "PermalinkClicks" ?#permalinkclicks;
                case "ProfileVisits" ?#profilevisits;
                case "QuoteTweets" ?#quotetweets;
                case "Replies" ?#replies;
                case "Retweets" ?#retweets;
                case "UniqueVideoViews" ?#uniquevideoviews;
                case "UrlClicks" ?#urlclicks;
                case "UserProfileClicks" ?#userprofileclicks;
                case "VideoCompletions" ?#videocompletions;
                case "VideoPlayed25Percent" ?#videoplayed25percent;
                case "VideoPlayed50Percent" ?#videoplayed50percent;
                case "VideoPlayed75Percent" ?#videoplayed75percent;
                case "VideoStarts" ?#videostarts;
                case "VideoViews" ?#videoviews;
                case _ null;
            };
    }
}
