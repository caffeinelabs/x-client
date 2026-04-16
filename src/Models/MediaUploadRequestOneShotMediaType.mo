/// The type of image or subtitle.

// MediaUploadRequestOneShotMediaType.mo
/// Enum values: #text_srt, #text_vtt, #image_jpeg, #image_bmp, #image_png, #image_webp, #image_pjpeg, #image_tiff

module {
    // User-facing type: type-safe variants for application code
    public type MediaUploadRequestOneShotMediaType = {
        #text_srt;
        #text_vtt;
        #image_jpeg;
        #image_bmp;
        #image_png;
        #image_webp;
        #image_pjpeg;
        #image_tiff;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadRequestOneShotMediaType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadRequestOneShotMediaType) : JSON =
            switch (value) {
                case (#text_srt) "text/srt";
                case (#text_vtt) "text/vtt";
                case (#image_jpeg) "image/jpeg";
                case (#image_bmp) "image/bmp";
                case (#image_png) "image/png";
                case (#image_webp) "image/webp";
                case (#image_pjpeg) "image/pjpeg";
                case (#image_tiff) "image/tiff";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadRequestOneShotMediaType =
            switch (json) {
                case "text/srt" ?#text_srt;
                case "text/vtt" ?#text_vtt;
                case "image/jpeg" ?#image_jpeg;
                case "image/bmp" ?#image_bmp;
                case "image/png" ?#image_png;
                case "image/webp" ?#image_webp;
                case "image/pjpeg" ?#image_pjpeg;
                case "image/tiff" ?#image_tiff;
                case _ null;
            };
    }
}
