/// The type of image or subtitle.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaUploadRequestOneShotMediaType.mo
/// Enum values: #text_srt, #text_vtt, #image_jpeg, #image_bmp, #image_png, #image_webp, #image_pjpeg, #image_tiff

module {
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

    public module JSON {
        public func toCandidValue(value : MediaUploadRequestOneShotMediaType) : Candid.Candid =
            switch (value) {
                case (#text_srt) #Text("text/srt");
                case (#text_vtt) #Text("text/vtt");
                case (#image_jpeg) #Text("image/jpeg");
                case (#image_bmp) #Text("image/bmp");
                case (#image_png) #Text("image/png");
                case (#image_webp) #Text("image/webp");
                case (#image_pjpeg) #Text("image/pjpeg");
                case (#image_tiff) #Text("image/tiff");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadRequestOneShotMediaType =
            switch (candid) {
                case (#Text("text/srt")) ?#text_srt;
                case (#Text("text/vtt")) ?#text_vtt;
                case (#Text("image/jpeg")) ?#image_jpeg;
                case (#Text("image/bmp")) ?#image_bmp;
                case (#Text("image/png")) ?#image_png;
                case (#Text("image/webp")) ?#image_webp;
                case (#Text("image/pjpeg")) ?#image_pjpeg;
                case (#Text("image/tiff")) ?#image_tiff;
                case _ null;
            };

        public func toText(value : MediaUploadRequestOneShotMediaType) : Text =
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
    };
};
