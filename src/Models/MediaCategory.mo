/// A string enum value which identifies a media use-case. This identifier is used to enforce use-case specific constraints (e.g. file size, video duration) and enable advanced features.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaCategory.mo
/// Enum values: #amplify_video, #tweet_gif, #tweet_image, #tweet_video, #dm_gif, #dm_image, #dm_video, #subtitles

module {
    public type MediaCategory = {
        #amplify_video;
        #tweet_gif;
        #tweet_image;
        #tweet_video;
        #dm_gif;
        #dm_image;
        #dm_video;
        #subtitles;
    };

    public module JSON {
        public func toCandidValue(value : MediaCategory) : Candid.Candid =
            switch (value) {
                case (#amplify_video) #Text("amplify_video");
                case (#tweet_gif) #Text("tweet_gif");
                case (#tweet_image) #Text("tweet_image");
                case (#tweet_video) #Text("tweet_video");
                case (#dm_gif) #Text("dm_gif");
                case (#dm_image) #Text("dm_image");
                case (#dm_video) #Text("dm_video");
                case (#subtitles) #Text("subtitles");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaCategory =
            switch (candid) {
                case (#Text("amplify_video")) ?#amplify_video;
                case (#Text("tweet_gif")) ?#tweet_gif;
                case (#Text("tweet_image")) ?#tweet_image;
                case (#Text("tweet_video")) ?#tweet_video;
                case (#Text("dm_gif")) ?#dm_gif;
                case (#Text("dm_image")) ?#dm_image;
                case (#Text("dm_video")) ?#dm_video;
                case (#Text("subtitles")) ?#subtitles;
                case _ null;
            };

        public func toText(value : MediaCategory) : Text =
            switch (value) {
                case (#amplify_video) "amplify_video";
                case (#tweet_gif) "tweet_gif";
                case (#tweet_image) "tweet_image";
                case (#tweet_video) "tweet_video";
                case (#dm_gif) "dm_gif";
                case (#dm_image) "dm_image";
                case (#dm_video) "dm_video";
                case (#subtitles) "subtitles";
            };
    };
};
