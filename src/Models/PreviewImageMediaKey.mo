
import { type PreviewImageMediaKeyMediaCategory; JSON = PreviewImageMediaKeyMediaCategory } "./PreviewImageMediaKeyMediaCategory";

// PreviewImageMediaKey.mo

module {
    // User-facing type: what application code uses
    public type PreviewImageMediaKey = {
        /// The unique identifier of this Media.
        media : ?Text;
        media_category : ?PreviewImageMediaKeyMediaCategory;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PreviewImageMediaKey type
        public type JSON = {
            media : ?Text;
            media_category : ?PreviewImageMediaKeyMediaCategory.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PreviewImageMediaKey) : JSON = { value with
            media_category = do ? { PreviewImageMediaKeyMediaCategory.toJSON(value.media_category!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PreviewImageMediaKey {
            ?{ json with
                media_category = do ? { PreviewImageMediaKeyMediaCategory.fromJSON(json.media_category!)! };
            }
        };
    }
}
