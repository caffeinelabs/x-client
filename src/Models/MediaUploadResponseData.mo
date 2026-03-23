
import { type ProcessingInfo; JSON = ProcessingInfo } "./ProcessingInfo";

// MediaUploadResponseData.mo

module {
    // User-facing type: what application code uses
    public type MediaUploadResponseData = {
        /// Number of seconds after which upload session expires.
        expires_after_secs : ?Int;
        /// The unique identifier of this Media.
        id : ?Text;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        processing_info : ?ProcessingInfo;
        /// Size of the upload
        size : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadResponseData type
        public type JSON = {
            expires_after_secs : ?Int;
            id : ?Text;
            media_key : ?Text;
            processing_info : ?ProcessingInfo.JSON;
            size : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadResponseData) : JSON = { value with
            processing_info = do ? { ProcessingInfo.toJSON(value.processing_info!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadResponseData {
            ?{ json with
                processing_info = do ? { ProcessingInfo.fromJSON(json.processing_info!)! };
            }
        };
    }
}
