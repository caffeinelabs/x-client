
import { type Media; JSON = Media } "./Media";

import { type Variant; JSON = Variant } "./Variant";

import { type VideoAllOfNonPublicMetrics; JSON = VideoAllOfNonPublicMetrics } "./VideoAllOfNonPublicMetrics";

import { type VideoAllOfOrganicMetrics; JSON = VideoAllOfOrganicMetrics } "./VideoAllOfOrganicMetrics";

import { type VideoAllOfPromotedMetrics; JSON = VideoAllOfPromotedMetrics } "./VideoAllOfPromotedMetrics";

import { type VideoAllOfPublicMetrics; JSON = VideoAllOfPublicMetrics } "./VideoAllOfPublicMetrics";

import Int "mo:core/Int";

// Video.mo

module {
    // User-facing type: what application code uses
    public type Video = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        type_ : Text;
        /// The width of the media in pixels.
        width : ?Nat;
        duration_ms : ?Int;
        non_public_metrics : ?VideoAllOfNonPublicMetrics;
        organic_metrics : ?VideoAllOfOrganicMetrics;
        preview_image_url : ?Text;
        promoted_metrics : ?VideoAllOfPromotedMetrics;
        public_metrics : ?VideoAllOfPublicMetrics;
        /// An array of all available variants of the media.
        variants : ?[Variant];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Video type
        public type JSON = {
            height : ?Int;
            media_key : ?Text;
            type_ : Text;
            width : ?Int;
            duration_ms : ?Int;
            non_public_metrics : ?VideoAllOfNonPublicMetrics;
            organic_metrics : ?VideoAllOfOrganicMetrics;
            preview_image_url : ?Text;
            promoted_metrics : ?VideoAllOfPromotedMetrics;
            public_metrics : ?VideoAllOfPublicMetrics;
            variants : ?[Variant];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Video) : JSON = {
            height = value.height;
            media_key = value.media_key;
            type_ = value.type_;
            width = value.width;
            duration_ms = value.duration_ms;
            non_public_metrics = value.non_public_metrics;
            organic_metrics = value.organic_metrics;
            preview_image_url = value.preview_image_url;
            promoted_metrics = value.promoted_metrics;
            public_metrics = value.public_metrics;
            variants = value.variants;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Video {
            ?{
                height = do ? { let v = json.height!; if (v < 0) return null else Int.abs(v) };
                media_key = json.media_key;
                type_ = json.type_;
                width = do ? { let v = json.width!; if (v < 0) return null else Int.abs(v) };
                duration_ms = json.duration_ms;
                non_public_metrics = json.non_public_metrics;
                organic_metrics = json.organic_metrics;
                preview_image_url = json.preview_image_url;
                promoted_metrics = json.promoted_metrics;
                public_metrics = json.public_metrics;
                variants = json.variants;
            }
        };
    }
}
