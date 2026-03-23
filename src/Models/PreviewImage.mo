
import { type PreviewImageMediaKey; JSON = PreviewImageMediaKey } "./PreviewImageMediaKey";

// PreviewImage.mo

module {
    // User-facing type: what application code uses
    public type PreviewImage = {
        media_key : PreviewImageMediaKey;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PreviewImage type
        public type JSON = {
            media_key : PreviewImageMediaKey.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PreviewImage) : JSON = {
            media_key = PreviewImageMediaKey.toJSON(value.media_key);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PreviewImage {
            let ?media_key = PreviewImageMediaKey.fromJSON(json.media_key) else return null;
            ?{
                media_key;
            }
        };
    }
}
