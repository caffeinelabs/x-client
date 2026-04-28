/// Represent the information for the URL image.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// UrlImage.mo

module {
    public type UrlImage = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// A validly formatted URL.
        url : ?Text;
        /// The width of the media in pixels.
        width : ?Nat;
    };

    public module JSON {
        public func toCandidValue(value : UrlImage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.height) {
                case (?v__) List.add(buf, ("height", #Nat(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", #Text(v__)));
                case null ();
            };
            switch (value.width) {
                case (?v__) List.add(buf, ("width", #Nat(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UrlImage =
            switch (candid) {
                case (#Record(fields)) {
                    let height : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "height")) {
                        case (?height_field) ((switch (height_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) ((switch (url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let width : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "width")) {
                        case (?width_field) ((switch (width_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    ?{
                        height;
                        url;
                        width;
                    };
                };
                case _ null;
            };
    };
};
