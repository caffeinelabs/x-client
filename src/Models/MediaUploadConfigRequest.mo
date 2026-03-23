
import { type MediaCategory; JSON = MediaCategory } "./MediaCategory";

import { type MediaUploadConfigRequestMediaType; JSON = MediaUploadConfigRequestMediaType } "./MediaUploadConfigRequestMediaType";

import Int "mo:core/Int";

// MediaUploadConfigRequest.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadConfigRequest = {
        additional_owners : ?[Text];
        media_category : ?MediaCategory;
        media_type : ?MediaUploadConfigRequestMediaType;
        /// Whether this media is shared or not.
        shared_ : ?Bool;
        /// The total size of the media upload in bytes.
        total_bytes : ?Nat;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadConfigRequest type
        public type JSON = {
            additional_owners : ?[Text];
            media_category : ?MediaCategory.JSON;
            media_type : ?MediaUploadConfigRequestMediaType.JSON;
            shared_ : ?Bool;
            total_bytes : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadConfigRequest) : JSON = { value with
            media_category = do ? { MediaCategory.toJSON(value.media_category!) };
            media_type = do ? { MediaUploadConfigRequestMediaType.toJSON(value.media_type!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadConfigRequest {
            ?{ json with
                media_category = do ? { MediaCategory.fromJSON(json.media_category!)! };
                media_type = do ? { MediaUploadConfigRequestMediaType.fromJSON(json.media_type!)! };
                total_bytes = switch (json.total_bytes) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
            }
        };
    }
}
