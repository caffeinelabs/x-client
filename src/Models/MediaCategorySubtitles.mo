/// The media category of uploaded media to which subtitles should be added/deleted

// MediaCategorySubtitles.mo
/// Enum values: #amplifyvideo, #tweetvideo

module {
    // User-facing type: type-safe variants for application code
    public type MediaCategorySubtitles = {
        #amplifyvideo;
        #tweetvideo;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaCategorySubtitles type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaCategorySubtitles) : JSON =
            switch (value) {
                case (#amplifyvideo) "AmplifyVideo";
                case (#tweetvideo) "TweetVideo";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaCategorySubtitles =
            switch (json) {
                case "AmplifyVideo" ?#amplifyvideo;
                case "TweetVideo" ?#tweetvideo;
                case _ null;
            };
    }
}
