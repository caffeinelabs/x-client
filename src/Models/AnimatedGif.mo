
import { type Media; JSON = Media } "./Media";

import { type Variant; JSON = Variant } "./Variant";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// AnimatedGif.mo

module {
    public type AnimatedGif = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        type_ : Text;
        /// The width of the media in pixels.
        width : ?Nat;
        preview_image_url : ?Text;
        /// An array of all available variants of the media.
        variants : ?[Variant];
    };

    public module JSON {
        // `init` constructs a AnimatedGif from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AnimatedGif.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            type_ : Text;
        }) : AnimatedGif {
            let ?res = from_candid(to_candid(required)) : ?AnimatedGif else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AnimatedGif) : Candid.Candid {
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
            switch (value.preview_image_url) {
                case (?v__) List.add(buf, ("preview_image_url", #Text(v__)));
                case null ();
            };
            switch (value.variants) {
                case (?v__) List.add(buf, ("variants", #Array(Array.map<Variant, Candid.Candid>(v__, Variant.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AnimatedGif =
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
                    let preview_image_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "preview_image_url")) {
                        case (?preview_image_url_field) ((switch (preview_image_url_field.1) { case (#Text(s)) ?s; case _ null }));
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
                        preview_image_url;
                        variants;
                    };
                };
                case _ null;
            };
    };
};
