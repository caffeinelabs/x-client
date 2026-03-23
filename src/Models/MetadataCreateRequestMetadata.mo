
import { type AllowDownloadStatus; JSON = AllowDownloadStatus } "./AllowDownloadStatus";

import { type AltText; JSON = AltText } "./AltText";

import { type AudiencePolicy; JSON = AudiencePolicy } "./AudiencePolicy";

import { type ContentExpiration; JSON = ContentExpiration } "./ContentExpiration";

import { type DomainRestrictions; JSON = DomainRestrictions } "./DomainRestrictions";

import { type FoundMediaOrigin; JSON = FoundMediaOrigin } "./FoundMediaOrigin";

import { type GeoRestrictions; JSON = GeoRestrictions } "./GeoRestrictions";

import { type ManagementInfo; JSON = ManagementInfo } "./ManagementInfo";

import { type PreviewImage; JSON = PreviewImage } "./PreviewImage";

import { type SensitiveMediaWarning; JSON = SensitiveMediaWarning } "./SensitiveMediaWarning";

import { type SharedInfo; JSON = SharedInfo } "./SharedInfo";

import { type StickerInfo; JSON = StickerInfo } "./StickerInfo";

import { type UploadSource; JSON = UploadSource } "./UploadSource";

// MetadataCreateRequestMetadata.mo

module {
    // User-facing type: what application code uses
    public type MetadataCreateRequestMetadata = {
        allow_download_status : ?AllowDownloadStatus;
        alt_text : ?AltText;
        audience_policy : ?AudiencePolicy;
        content_expiration : ?ContentExpiration;
        domain_restrictions : ?DomainRestrictions;
        found_media_origin : ?FoundMediaOrigin;
        geo_restrictions : ?GeoRestrictions;
        management_info : ?ManagementInfo;
        preview_image : ?PreviewImage;
        sensitive_media_warning : ?SensitiveMediaWarning;
        shared_info : ?SharedInfo;
        sticker_info : ?StickerInfo;
        upload_source : ?UploadSource;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MetadataCreateRequestMetadata type
        public type JSON = {
            allow_download_status : ?AllowDownloadStatus;
            alt_text : ?AltText;
            audience_policy : ?AudiencePolicy;
            content_expiration : ?ContentExpiration;
            domain_restrictions : ?DomainRestrictions;
            found_media_origin : ?FoundMediaOrigin;
            geo_restrictions : ?GeoRestrictions;
            management_info : ?ManagementInfo;
            preview_image : ?PreviewImage.JSON;
            sensitive_media_warning : ?SensitiveMediaWarning;
            shared_info : ?SharedInfo;
            sticker_info : ?StickerInfo;
            upload_source : ?UploadSource;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MetadataCreateRequestMetadata) : JSON = { value with
            preview_image = do ? { PreviewImage.toJSON(value.preview_image!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MetadataCreateRequestMetadata {
            ?{ json with
                preview_image = do ? { PreviewImage.fromJSON(json.preview_image!)! };
            }
        };
    }
}
