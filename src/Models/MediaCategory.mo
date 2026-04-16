/// A string enum value which identifies a media use-case. This identifier is used to enforce use-case specific constraints (e.g. file size, video duration) and enable advanced features.

// MediaCategory.mo
/// Enum values: #amplify_video, #tweet_gif, #tweet_image, #tweet_video, #dm_gif, #dm_image, #dm_video, #subtitles

module {
    // User-facing type: type-safe variants for application code
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaCategory type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaCategory) : JSON =
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

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaCategory =
            switch (json) {
                case "amplify_video" ?#amplify_video;
                case "tweet_gif" ?#tweet_gif;
                case "tweet_image" ?#tweet_image;
                case "tweet_video" ?#tweet_video;
                case "dm_gif" ?#dm_gif;
                case "dm_image" ?#dm_image;
                case "dm_video" ?#dm_video;
                case "subtitles" ?#subtitles;
                case _ null;
            };
    }
}
