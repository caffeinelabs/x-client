
import { type MediaCategoryOneShot; JSON = MediaCategoryOneShot } "./MediaCategoryOneShot";

import { type MediaUploadRequestOneShotMedia; JSON = MediaUploadRequestOneShotMedia } "./MediaUploadRequestOneShotMedia";

import { type MediaUploadRequestOneShotMediaType; JSON = MediaUploadRequestOneShotMediaType } "./MediaUploadRequestOneShotMediaType";

// MediaUploadRequestOneShot.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadRequestOneShot = {
        additional_owners : ?[Text];
        media : MediaUploadRequestOneShotMedia;
        media_category : MediaCategoryOneShot;
        media_type : ?MediaUploadRequestOneShotMediaType;
        /// Whether this media is shared or not.
        shared_ : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadRequestOneShot type
        public type JSON = {
            additional_owners : ?[Text];
            media : MediaUploadRequestOneShotMedia;
            media_category : MediaCategoryOneShot.JSON;
            media_type : ?MediaUploadRequestOneShotMediaType.JSON;
            shared_ : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadRequestOneShot) : JSON = { value with
            media_category = MediaCategoryOneShot.toJSON(value.media_category);
            media_type = do ? { MediaUploadRequestOneShotMediaType.toJSON(value.media_type!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadRequestOneShot {
            let ?media_category = MediaCategoryOneShot.fromJSON(json.media_category) else return null;
            ?{ json with
                media_category;
                media_type = do ? { MediaUploadRequestOneShotMediaType.fromJSON(json.media_type!)! };
            }
        };
    }
}
