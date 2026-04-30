import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Sticker.mo

module {
    public type Sticker = {
        /// width-to-height ratio of the media
        aspect_ratio : ?Float;
        /// A unique identifier for the group of annotations associated with the media
        group_annotation_id : ?Float;
        /// Unique identifier for sticker
        id : ?Text;
        /// A unique identifier for the sticker set associated with the media
        sticker_set_annotation_id : ?Float;
        /// Scale or rotate the media on the x-axis
        transform_a : ?Float;
        /// Skew the media on the x-axis
        transform_b : ?Float;
        /// Skew the media on the y-axis
        transform_c : ?Float;
        /// Scale or rotate the media on the y-axis
        transform_d : ?Float;
        /// Scale or rotate the media on the x-axis
        transform_tx : ?Float;
        /// The vertical translation (shift) value for the media
        transform_ty : ?Float;
    };

    public module JSON {
        // `init` constructs a Sticker from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Sticker.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : Sticker {
            let ?res = from_candid(to_candid(required)) : ?Sticker else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Sticker) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.aspect_ratio) {
                case (?v__) List.add(buf, ("aspect_ratio", #Float(v__)));
                case null ();
            };
            switch (value.group_annotation_id) {
                case (?v__) List.add(buf, ("group_annotation_id", #Float(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.sticker_set_annotation_id) {
                case (?v__) List.add(buf, ("sticker_set_annotation_id", #Float(v__)));
                case null ();
            };
            switch (value.transform_a) {
                case (?v__) List.add(buf, ("transform_a", #Float(v__)));
                case null ();
            };
            switch (value.transform_b) {
                case (?v__) List.add(buf, ("transform_b", #Float(v__)));
                case null ();
            };
            switch (value.transform_c) {
                case (?v__) List.add(buf, ("transform_c", #Float(v__)));
                case null ();
            };
            switch (value.transform_d) {
                case (?v__) List.add(buf, ("transform_d", #Float(v__)));
                case null ();
            };
            switch (value.transform_tx) {
                case (?v__) List.add(buf, ("transform_tx", #Float(v__)));
                case null ();
            };
            switch (value.transform_ty) {
                case (?v__) List.add(buf, ("transform_ty", #Float(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Sticker =
            switch (candid) {
                case (#Record(fields)) {
                    let aspect_ratio : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "aspect_ratio")) {
                        case (?aspect_ratio_field) ((switch (aspect_ratio_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let group_annotation_id : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_annotation_id")) {
                        case (?group_annotation_id_field) ((switch (group_annotation_id_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let sticker_set_annotation_id : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sticker_set_annotation_id")) {
                        case (?sticker_set_annotation_id_field) ((switch (sticker_set_annotation_id_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_a : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_a")) {
                        case (?transform_a_field) ((switch (transform_a_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_b : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_b")) {
                        case (?transform_b_field) ((switch (transform_b_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_c : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_c")) {
                        case (?transform_c_field) ((switch (transform_c_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_d : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_d")) {
                        case (?transform_d_field) ((switch (transform_d_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_tx : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_tx")) {
                        case (?transform_tx_field) ((switch (transform_tx_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    let transform_ty : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "transform_ty")) {
                        case (?transform_ty_field) ((switch (transform_ty_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    ?{
                        aspect_ratio;
                        group_annotation_id;
                        id;
                        sticker_set_annotation_id;
                        transform_a;
                        transform_b;
                        transform_c;
                        transform_d;
                        transform_tx;
                        transform_ty;
                    };
                };
                case _ null;
            };
    };
};
