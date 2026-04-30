/// The type of media.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadConfigRequestMediaType.mo
/// Enum values: #video_mp4, #video_webm, #video_mp2t, #video_quicktime, #text_srt, #text_vtt, #image_jpeg, #image_gif, #image_bmp, #image_png, #image_webp, #image_pjpeg, #image_tiff, #model_gltf_binary, #model_vnd_usdz_zip

module {
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

    public module JSON {
        public func toCandidValue(value : MediaUploadConfigRequestMediaType) : Candid.Candid =
            switch (value) {
                case (#video_mp4) #Text("video/mp4");
                case (#video_webm) #Text("video/webm");
                case (#video_mp2t) #Text("video/mp2t");
                case (#video_quicktime) #Text("video/quicktime");
                case (#text_srt) #Text("text/srt");
                case (#text_vtt) #Text("text/vtt");
                case (#image_jpeg) #Text("image/jpeg");
                case (#image_gif) #Text("image/gif");
                case (#image_bmp) #Text("image/bmp");
                case (#image_png) #Text("image/png");
                case (#image_webp) #Text("image/webp");
                case (#image_pjpeg) #Text("image/pjpeg");
                case (#image_tiff) #Text("image/tiff");
                case (#model_gltf_binary) #Text("model/gltf-binary");
                case (#model_vnd_usdz_zip) #Text("model/vnd.usdz+zip");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadConfigRequestMediaType =
            switch (candid) {
                case (#Text("video/mp4")) ?#video_mp4;
                case (#Text("video/webm")) ?#video_webm;
                case (#Text("video/mp2t")) ?#video_mp2t;
                case (#Text("video/quicktime")) ?#video_quicktime;
                case (#Text("text/srt")) ?#text_srt;
                case (#Text("text/vtt")) ?#text_vtt;
                case (#Text("image/jpeg")) ?#image_jpeg;
                case (#Text("image/gif")) ?#image_gif;
                case (#Text("image/bmp")) ?#image_bmp;
                case (#Text("image/png")) ?#image_png;
                case (#Text("image/webp")) ?#image_webp;
                case (#Text("image/pjpeg")) ?#image_pjpeg;
                case (#Text("image/tiff")) ?#image_tiff;
                case (#Text("model/gltf-binary")) ?#model_gltf_binary;
                case (#Text("model/vnd.usdz+zip")) ?#model_vnd_usdz_zip;
                case _ null;
            };

        public func toText(value : MediaUploadConfigRequestMediaType) : Text =
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
    };
};
