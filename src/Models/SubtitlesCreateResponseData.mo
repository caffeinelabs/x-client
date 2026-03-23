
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";

import { type Subtitles; JSON = Subtitles } "./Subtitles";

// SubtitlesCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type SubtitlesCreateResponseData = {
        associated_subtitles : [Subtitles];
        /// The unique identifier of this Media.
        id : Text;
        media_category : MediaCategorySubtitles;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SubtitlesCreateResponseData type
        public type JSON = {
            associated_subtitles : [Subtitles];
            id : Text;
            media_category : MediaCategorySubtitles.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SubtitlesCreateResponseData) : JSON = { value with
            media_category = MediaCategorySubtitles.toJSON(value.media_category);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SubtitlesCreateResponseData {
            let ?media_category = MediaCategorySubtitles.fromJSON(json.media_category) else return null;
            ?{ json with
                media_category;
            }
        };
    }
}
