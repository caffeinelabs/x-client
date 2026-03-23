
// MediaUploadConfigRequestMediaType.mo
/// The type of media.
/// Enum values: #video_mp4, #video_webm, #video_mp2t, #video_quicktime, #text_srt, #text_vtt, #image_jpeg, #image_gif, #image_bmp, #image_png, #image_webp, #image_pjpeg, #image_tiff, #model_gltf_binary, #model_vnd_usdz_zip

module {
    // User-facing type: type-safe variants for application code
    public type MediaUploadConfigRequestMediaType = {
        #video_mp4;
        #video_webm;
        #video_mp2t;
        #video_quicktime;
        #text_srt;
        #text_vtt;
        #image_jpeg;
        #image_gif;
        #image_bmp;
        #image_png;
        #image_webp;
        #image_pjpeg;
        #image_tiff;
        #model_gltf_binary;
        #model_vnd_usdz_zip;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaUploadConfigRequestMediaType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaUploadConfigRequestMediaType) : JSON =
            switch (value) {
                case (#video_mp4) "video/mp4";
                case (#video_webm) "video/webm";
                case (#video_mp2t) "video/mp2t";
                case (#video_quicktime) "video/quicktime";
                case (#text_srt) "text/srt";
                case (#text_vtt) "text/vtt";
                case (#image_jpeg) "image/jpeg";
                case (#image_gif) "image/gif";
                case (#image_bmp) "image/bmp";
                case (#image_png) "image/png";
                case (#image_webp) "image/webp";
                case (#image_pjpeg) "image/pjpeg";
                case (#image_tiff) "image/tiff";
                case (#model_gltf_binary) "model/gltf-binary";
                case (#model_vnd_usdz_zip) "model/vnd.usdz+zip";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaUploadConfigRequestMediaType =
            switch (json) {
                case "video/mp4" ?#video_mp4;
                case "video/webm" ?#video_webm;
                case "video/mp2t" ?#video_mp2t;
                case "video/quicktime" ?#video_quicktime;
                case "text/srt" ?#text_srt;
                case "text/vtt" ?#text_vtt;
                case "image/jpeg" ?#image_jpeg;
                case "image/gif" ?#image_gif;
                case "image/bmp" ?#image_bmp;
                case "image/png" ?#image_png;
                case "image/webp" ?#image_webp;
                case "image/pjpeg" ?#image_pjpeg;
                case "image/tiff" ?#image_tiff;
                case "model/gltf-binary" ?#model_gltf_binary;
                case "model/vnd.usdz+zip" ?#model_vnd_usdz_zip;
                case _ null;
            };
    }
}
