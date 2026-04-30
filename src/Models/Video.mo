
import { type Media; JSON = Media } "./Media";

import { type Variant; JSON = Variant } "./Variant";

import { type VideoAllOfNonPublicMetrics; JSON = VideoAllOfNonPublicMetrics } "./VideoAllOfNonPublicMetrics";

import { type VideoAllOfOrganicMetrics; JSON = VideoAllOfOrganicMetrics } "./VideoAllOfOrganicMetrics";

import { type VideoAllOfPromotedMetrics; JSON = VideoAllOfPromotedMetrics } "./VideoAllOfPromotedMetrics";

import { type VideoAllOfPublicMetrics; JSON = VideoAllOfPublicMetrics } "./VideoAllOfPublicMetrics";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// Video.mo

module {
    /// The required-fields slice of Video — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Video as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        height : ?Nat;
        media_key : ?Text;
        width : ?Nat;
        duration_ms : ?Int;
        non_public_metrics : ?VideoAllOfNonPublicMetrics;
        organic_metrics : ?VideoAllOfOrganicMetrics;
        preview_image_url : ?Text;
        promoted_metrics : ?VideoAllOfPromotedMetrics;
        public_metrics : ?VideoAllOfPublicMetrics;
        variants : ?[Variant];
    };

    public type Video = Required and Optional;

    public module JSON {
        // `init` constructs a Video from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Video.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Video {
            let ?res = from_candid(to_candid(required)) : ?Video else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Video) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.height) {
                case (?v__) List.add(buf, ("height", #Nat(v__)));
                case null ();
            };
            switch (value.media_key) {
                case (?v__) List.add(buf, ("media_key", #Text(v__)));
                case null ();
            };
            List.add(buf, ("type", #Text(value.type_)));
            switch (value.width) {
                case (?v__) List.add(buf, ("width", #Nat(v__)));
                case null ();
            };
            switch (value.duration_ms) {
                case (?v__) List.add(buf, ("duration_ms", #Int(v__)));
                case null ();
            };
            switch (value.non_public_metrics) {
                case (?v__) List.add(buf, ("non_public_metrics", VideoAllOfNonPublicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.organic_metrics) {
                case (?v__) List.add(buf, ("organic_metrics", VideoAllOfOrganicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.preview_image_url) {
                case (?v__) List.add(buf, ("preview_image_url", #Text(v__)));
                case null ();
            };
            switch (value.promoted_metrics) {
                case (?v__) List.add(buf, ("promoted_metrics", VideoAllOfPromotedMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.public_metrics) {
                case (?v__) List.add(buf, ("public_metrics", VideoAllOfPublicMetrics.toCandidValue(v__)));
                case null ();
            };
            switch (value.variants) {
                case (?v__) List.add(buf, ("variants", #Array(Array.map<Variant, Candid.Candid>(v__, Variant.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Video =
            switch (candid) {
                case (#Record(fields)) {
                    let height : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "height")) {
                        case (?height_field) ((switch (height_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let media_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_key")) {
                        case (?media_key_field) ((switch (media_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let width : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "width")) {
                        case (?width_field) ((switch (width_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let duration_ms : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "duration_ms")) {
                        case (?duration_ms_field) ((switch (duration_ms_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let non_public_metrics : ?VideoAllOfNonPublicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "non_public_metrics")) {
                        case (?non_public_metrics_field) (VideoAllOfNonPublicMetrics.fromCandidValue(non_public_metrics_field.1));
                        case null null;
                    };
                    let organic_metrics : ?VideoAllOfOrganicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "organic_metrics")) {
                        case (?organic_metrics_field) (VideoAllOfOrganicMetrics.fromCandidValue(organic_metrics_field.1));
                        case null null;
                    };
                    let preview_image_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "preview_image_url")) {
                        case (?preview_image_url_field) ((switch (preview_image_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let promoted_metrics : ?VideoAllOfPromotedMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "promoted_metrics")) {
                        case (?promoted_metrics_field) (VideoAllOfPromotedMetrics.fromCandidValue(promoted_metrics_field.1));
                        case null null;
                    };
                    let public_metrics : ?VideoAllOfPublicMetrics = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_metrics")) {
                        case (?public_metrics_field) (VideoAllOfPublicMetrics.fromCandidValue(public_metrics_field.1));
                        case null null;
                    };
                    let variants : ?[Variant] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "variants")) {
                        case (?variants_field) ((switch (variants_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Variant>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Variant.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        height;
                        media_key;
                        type_;
                        width;
                        duration_ms;
                        non_public_metrics;
                        organic_metrics;
                        preview_image_url;
                        promoted_metrics;
                        public_metrics;
                        variants;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
