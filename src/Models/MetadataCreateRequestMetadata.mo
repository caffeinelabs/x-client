
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
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MetadataCreateRequestMetadata.mo

module {
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

    public module JSON {
        // `init` constructs a MetadataCreateRequestMetadata from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MetadataCreateRequestMetadata.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MetadataCreateRequestMetadata {
            let ?res = from_candid(to_candid(required)) : ?MetadataCreateRequestMetadata else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MetadataCreateRequestMetadata) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.allow_download_status) {
                case (?v__) List.add(buf, ("allow_download_status", AllowDownloadStatus.toCandidValue(v__)));
                case null ();
            };
            switch (value.alt_text) {
                case (?v__) List.add(buf, ("alt_text", AltText.toCandidValue(v__)));
                case null ();
            };
            switch (value.audience_policy) {
                case (?v__) List.add(buf, ("audience_policy", AudiencePolicy.toCandidValue(v__)));
                case null ();
            };
            switch (value.content_expiration) {
                case (?v__) List.add(buf, ("content_expiration", ContentExpiration.toCandidValue(v__)));
                case null ();
            };
            switch (value.domain_restrictions) {
                case (?v__) List.add(buf, ("domain_restrictions", DomainRestrictions.toCandidValue(v__)));
                case null ();
            };
            switch (value.found_media_origin) {
                case (?v__) List.add(buf, ("found_media_origin", FoundMediaOrigin.toCandidValue(v__)));
                case null ();
            };
            switch (value.geo_restrictions) {
                case (?v__) List.add(buf, ("geo_restrictions", GeoRestrictions.toCandidValue(v__)));
                case null ();
            };
            switch (value.management_info) {
                case (?v__) List.add(buf, ("management_info", ManagementInfo.toCandidValue(v__)));
                case null ();
            };
            switch (value.preview_image) {
                case (?v__) List.add(buf, ("preview_image", PreviewImage.toCandidValue(v__)));
                case null ();
            };
            switch (value.sensitive_media_warning) {
                case (?v__) List.add(buf, ("sensitive_media_warning", SensitiveMediaWarning.toCandidValue(v__)));
                case null ();
            };
            switch (value.shared_info) {
                case (?v__) List.add(buf, ("shared_info", SharedInfo.toCandidValue(v__)));
                case null ();
            };
            switch (value.sticker_info) {
                case (?v__) List.add(buf, ("sticker_info", StickerInfo.toCandidValue(v__)));
                case null ();
            };
            switch (value.upload_source) {
                case (?v__) List.add(buf, ("upload_source", UploadSource.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MetadataCreateRequestMetadata =
            switch (candid) {
                case (#Record(fields)) {
                    let allow_download_status : ?AllowDownloadStatus = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "allow_download_status")) {
                        case (?allow_download_status_field) (AllowDownloadStatus.fromCandidValue(allow_download_status_field.1));
                        case null null;
                    };
                    let alt_text : ?AltText = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "alt_text")) {
                        case (?alt_text_field) (AltText.fromCandidValue(alt_text_field.1));
                        case null null;
                    };
                    let audience_policy : ?AudiencePolicy = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "audience_policy")) {
                        case (?audience_policy_field) (AudiencePolicy.fromCandidValue(audience_policy_field.1));
                        case null null;
                    };
                    let content_expiration : ?ContentExpiration = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "content_expiration")) {
                        case (?content_expiration_field) (ContentExpiration.fromCandidValue(content_expiration_field.1));
                        case null null;
                    };
                    let domain_restrictions : ?DomainRestrictions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "domain_restrictions")) {
                        case (?domain_restrictions_field) (DomainRestrictions.fromCandidValue(domain_restrictions_field.1));
                        case null null;
                    };
                    let found_media_origin : ?FoundMediaOrigin = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "found_media_origin")) {
                        case (?found_media_origin_field) (FoundMediaOrigin.fromCandidValue(found_media_origin_field.1));
                        case null null;
                    };
                    let geo_restrictions : ?GeoRestrictions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "geo_restrictions")) {
                        case (?geo_restrictions_field) (GeoRestrictions.fromCandidValue(geo_restrictions_field.1));
                        case null null;
                    };
                    let management_info : ?ManagementInfo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "management_info")) {
                        case (?management_info_field) (ManagementInfo.fromCandidValue(management_info_field.1));
                        case null null;
                    };
                    let preview_image : ?PreviewImage = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "preview_image")) {
                        case (?preview_image_field) (PreviewImage.fromCandidValue(preview_image_field.1));
                        case null null;
                    };
                    let sensitive_media_warning : ?SensitiveMediaWarning = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sensitive_media_warning")) {
                        case (?sensitive_media_warning_field) (SensitiveMediaWarning.fromCandidValue(sensitive_media_warning_field.1));
                        case null null;
                    };
                    let shared_info : ?SharedInfo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "shared_info")) {
                        case (?shared_info_field) (SharedInfo.fromCandidValue(shared_info_field.1));
                        case null null;
                    };
                    let sticker_info : ?StickerInfo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sticker_info")) {
                        case (?sticker_info_field) (StickerInfo.fromCandidValue(sticker_info_field.1));
                        case null null;
                    };
                    let upload_source : ?UploadSource = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "upload_source")) {
                        case (?upload_source_field) (UploadSource.fromCandidValue(upload_source_field.1));
                        case null null;
                    };
                    ?{
                        allow_download_status;
                        alt_text;
                        audience_policy;
                        content_expiration;
                        domain_restrictions;
                        found_media_origin;
                        geo_restrictions;
                        management_info;
                        preview_image;
                        sensitive_media_warning;
                        shared_info;
                        sticker_info;
                        upload_source;
                    };
                };
                case _ null;
            };
    };
};
