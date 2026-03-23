
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";

// MediaUploadAppendRequestAnyOf.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadAppendRequestAnyOf = {
        /// The file to upload.
        media : Blob;
        segment_index : MediaSegments;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadAppendRequestAnyOf type
        public type JSON = {
            media : Blob;
            segment_index : MediaSegments;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadAppendRequestAnyOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadAppendRequestAnyOf = ?json;
    }
}
