import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// Media.mo

module {
    public type Media = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        type_ : Text;
        /// The width of the media in pixels.
        width : ?Nat;
    };

    public module JSON {
        public func toCandidValue(value : Media) : Candid.Candid {
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
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Media =
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
                    ?{
                        height;
                        media_key;
                        type_;
                        width;
                    };
                };
                case _ null;
            };
    };
};
