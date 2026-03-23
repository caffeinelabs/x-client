
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";

// ChatMediaUploadAppendRequestAnyOf.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadAppendRequestAnyOf = {
        /// XChat conversation identifier for the upload.
        conversation_id : Text;
        /// The file to upload.
        media : Blob;
        /// Media hash key returned from initialize.
        media_hash_key : Text;
        segment_index : MediaSegments;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadAppendRequestAnyOf type
        public type JSON = {
            conversation_id : Text;
            media : Blob;
            media_hash_key : Text;
            segment_index : MediaSegments;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadAppendRequestAnyOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadAppendRequestAnyOf = ?json;
    }
}
