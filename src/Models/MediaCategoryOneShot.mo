/// A string enum value which identifies a media use-case. This identifier is used to enforce use-case specific constraints (e.g. file size) and enable advanced features.

// MediaCategoryOneShot.mo
/// Enum values: #tweet_image, #dm_image, #subtitles

module {
    // User-facing type: type-safe variants for application code
    public type MediaCategoryOneShot = {
        #tweet_image;
        #dm_image;
        #subtitles;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaCategoryOneShot type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaCategoryOneShot) : JSON =
            switch (value) {
                case (#tweet_image) "tweet_image";
                case (#dm_image) "dm_image";
                case (#subtitles) "subtitles";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaCategoryOneShot =
            switch (json) {
                case "tweet_image" ?#tweet_image;
                case "dm_image" ?#dm_image;
                case "subtitles" ?#subtitles;
                case _ null;
            };
    }
}
