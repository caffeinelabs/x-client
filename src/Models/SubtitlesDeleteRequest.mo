
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

// SubtitlesDeleteRequest.mo

module {
    // User-facing type: what application code uses
    public type SubtitlesDeleteRequest = {
        /// The unique identifier of this Media.
        id : ?Text;
        /// The language code should be a BCP47 code (e.g. 'EN\", \"SP\")
        language_code : ?Text;
        media_category : ?MediaCategorySubtitles;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubtitlesDeleteRequest type
        public type JSON = {
            id : ?Text;
            language_code : ?Text;
            media_category : ?MediaCategorySubtitles.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubtitlesDeleteRequest) : JSON = { value with
            media_category = do ? { MediaCategorySubtitles.toJSON(value.media_category!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubtitlesDeleteRequest {
            ?{ json with
                media_category = do ? { MediaCategorySubtitles.fromJSON(json.media_category!)! };
            }
        };
    }
}
