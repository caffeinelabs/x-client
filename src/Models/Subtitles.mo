
// Subtitles.mo

module {
    // User-facing type: what application code uses
    public type Subtitles = {
        /// Language name in a human readable form
        display_name : ?Text;
        /// The unique identifier of this Media.
        id : ?Text;
        /// The language code should be a BCP47 code (e.g. 'EN\", \"SP\")
        language_code : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Subtitles type
        public type JSON = {
            display_name : ?Text;
            id : ?Text;
            language_code : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Subtitles) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Subtitles = ?json;
    }
}
