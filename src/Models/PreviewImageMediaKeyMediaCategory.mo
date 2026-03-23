
// PreviewImageMediaKeyMediaCategory.mo
/// The media category of media
/// Enum values: #tweetimage

module {
    // User-facing type: type-safe variants for application code
    public type PreviewImageMediaKeyMediaCategory = {
        #tweetimage;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PreviewImageMediaKeyMediaCategory type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PreviewImageMediaKeyMediaCategory) : JSON =
            switch (value) {
                case (#tweetimage) "TweetImage";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PreviewImageMediaKeyMediaCategory =
            switch (json) {
                case "TweetImage" ?#tweetimage;
                case _ null;
            };
    }
}
