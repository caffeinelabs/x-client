/// The media category of uploaded media to which subtitles should be added/deleted
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaCategorySubtitles.mo
/// Enum values: #amplifyvideo, #tweetvideo

module {
    public type MediaCategorySubtitles = {
        #amplifyvideo;
        #tweetvideo;
    };

    public module JSON {
        public func toCandidValue(value : MediaCategorySubtitles) : Candid.Candid =
            switch (value) {
                case (#amplifyvideo) #Text("AmplifyVideo");
                case (#tweetvideo) #Text("TweetVideo");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaCategorySubtitles =
            switch (candid) {
                case (#Text("AmplifyVideo")) ?#amplifyvideo;
                case (#Text("TweetVideo")) ?#tweetvideo;
                case _ null;
            };

        public func toText(value : MediaCategorySubtitles) : Text =
            switch (value) {
                case (#amplifyvideo) "AmplifyVideo";
                case (#tweetvideo) "TweetVideo";
            };
    };
};
