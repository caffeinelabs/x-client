
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";

// SubtitlesCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type SubtitlesCreateRequest = {
        /// The unique identifier of this Media.
        id : ?Text;
        media_category : ?MediaCategorySubtitles;
        subtitles : ?Subtitles;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubtitlesCreateRequest type
        public type JSON = {
            id : ?Text;
            media_category : ?MediaCategorySubtitles.JSON;
            subtitles : ?Subtitles;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubtitlesCreateRequest) : JSON = { value with
            media_category = do ? { MediaCategorySubtitles.toJSON(value.media_category!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubtitlesCreateRequest {
            ?{ json with
                media_category = do ? { MediaCategorySubtitles.fromJSON(json.media_category!)! };
            }
        };
    }
}
