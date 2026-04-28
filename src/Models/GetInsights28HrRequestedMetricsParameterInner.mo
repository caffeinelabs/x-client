import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetInsights28HrRequestedMetricsParameterInner.mo
/// Enum values: #appinstallattempts, #appopens, #detailexpands, #emailtweet, #engagements, #follows, #hashtagclicks, #impressions, #likes, #linkclicks, #mediaengagements, #mediaviews, #permalinkclicks, #profilevisits, #quotetweets, #replies, #retweets, #uniquevideoviews, #urlclicks, #userprofileclicks, #videocompletions, #videoplayed25percent, #videoplayed50percent, #videoplayed75percent, #videostarts, #videoviews

module {
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

    public module JSON {
        public func toCandidValue(value : GetInsights28HrRequestedMetricsParameterInner) : Candid.Candid =
            switch (value) {
                case (#appinstallattempts) #Text("AppInstallAttempts");
                case (#appopens) #Text("AppOpens");
                case (#detailexpands) #Text("DetailExpands");
                case (#emailtweet) #Text("EmailTweet");
                case (#engagements) #Text("Engagements");
                case (#follows) #Text("Follows");
                case (#hashtagclicks) #Text("HashtagClicks");
                case (#impressions) #Text("Impressions");
                case (#likes) #Text("Likes");
                case (#linkclicks) #Text("LinkClicks");
                case (#mediaengagements) #Text("MediaEngagements");
                case (#mediaviews) #Text("MediaViews");
                case (#permalinkclicks) #Text("PermalinkClicks");
                case (#profilevisits) #Text("ProfileVisits");
                case (#quotetweets) #Text("QuoteTweets");
                case (#replies) #Text("Replies");
                case (#retweets) #Text("Retweets");
                case (#uniquevideoviews) #Text("UniqueVideoViews");
                case (#urlclicks) #Text("UrlClicks");
                case (#userprofileclicks) #Text("UserProfileClicks");
                case (#videocompletions) #Text("VideoCompletions");
                case (#videoplayed25percent) #Text("VideoPlayed25Percent");
                case (#videoplayed50percent) #Text("VideoPlayed50Percent");
                case (#videoplayed75percent) #Text("VideoPlayed75Percent");
                case (#videostarts) #Text("VideoStarts");
                case (#videoviews) #Text("VideoViews");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetInsights28HrRequestedMetricsParameterInner =
            switch (candid) {
                case (#Text("AppInstallAttempts")) ?#appinstallattempts;
                case (#Text("AppOpens")) ?#appopens;
                case (#Text("DetailExpands")) ?#detailexpands;
                case (#Text("EmailTweet")) ?#emailtweet;
                case (#Text("Engagements")) ?#engagements;
                case (#Text("Follows")) ?#follows;
                case (#Text("HashtagClicks")) ?#hashtagclicks;
                case (#Text("Impressions")) ?#impressions;
                case (#Text("Likes")) ?#likes;
                case (#Text("LinkClicks")) ?#linkclicks;
                case (#Text("MediaEngagements")) ?#mediaengagements;
                case (#Text("MediaViews")) ?#mediaviews;
                case (#Text("PermalinkClicks")) ?#permalinkclicks;
                case (#Text("ProfileVisits")) ?#profilevisits;
                case (#Text("QuoteTweets")) ?#quotetweets;
                case (#Text("Replies")) ?#replies;
                case (#Text("Retweets")) ?#retweets;
                case (#Text("UniqueVideoViews")) ?#uniquevideoviews;
                case (#Text("UrlClicks")) ?#urlclicks;
                case (#Text("UserProfileClicks")) ?#userprofileclicks;
                case (#Text("VideoCompletions")) ?#videocompletions;
                case (#Text("VideoPlayed25Percent")) ?#videoplayed25percent;
                case (#Text("VideoPlayed50Percent")) ?#videoplayed50percent;
                case (#Text("VideoPlayed75Percent")) ?#videoplayed75percent;
                case (#Text("VideoStarts")) ?#videostarts;
                case (#Text("VideoViews")) ?#videoviews;
                case _ null;
            };

        public func toText(value : GetInsights28HrRequestedMetricsParameterInner) : Text =
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
    };
};
