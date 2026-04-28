/// Represent the portion of text recognized as a URL, and its start and end position within the text.

import { type UrlImage; JSON = UrlImage } "./UrlImage";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Int "mo:core/Int";

// UrlEntityDm.mo

module {
    public type UrlEntityDm = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// Description of the URL landing page.
        description : ?Text;
        /// The URL as displayed in the X client.
        display_url : ?Text;
        /// A validly formatted URL.
        expanded_url : ?Text;
        images : ?[UrlImage];
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        /// HTTP Status Code.
        status : ?Nat;
        /// Title of the page the URL points to.
        title : ?Text;
        /// Fully resolved url.
        unwound_url : ?Text;
        /// A validly formatted URL.
        url : Text;
    };

    public module JSON {
        public func toCandidValue(value : UrlEntityDm) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("end", #Nat(value.end)));
            List.add(buf, ("start", #Nat(value.start)));
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            switch (value.display_url) {
                case (?v__) List.add(buf, ("display_url", #Text(v__)));
                case null ();
            };
            switch (value.expanded_url) {
                case (?v__) List.add(buf, ("expanded_url", #Text(v__)));
                case null ();
            };
            switch (value.images) {
                case (?v__) List.add(buf, ("images", #Array(Array.map<UrlImage, Candid.Candid>(v__, UrlImage.toCandidValue))));
                case null ();
            };
            switch (value.media_key) {
                case (?v__) List.add(buf, ("media_key", #Text(v__)));
                case null ();
            };
            switch (value.status) {
                case (?v__) List.add(buf, ("status", #Nat(v__)));
                case null ();
            };
            switch (value.title) {
                case (?v__) List.add(buf, ("title", #Text(v__)));
                case null ();
            };
            switch (value.unwound_url) {
                case (?v__) List.add(buf, ("unwound_url", #Text(v__)));
                case null ();
            };
            List.add(buf, ("url", #Text(value.url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UrlEntityDm =
            switch (candid) {
                case (#Record(fields)) {
                    let ?end_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end") else return null;
                    let ?end = ((switch (end_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?start_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "start") else return null;
                    let ?start = ((switch (start_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let display_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "display_url")) {
                        case (?display_url_field) ((switch (display_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let expanded_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "expanded_url")) {
                        case (?expanded_url_field) ((switch (expanded_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let images : ?[UrlImage] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "images")) {
                        case (?images_field) ((switch (images_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlImage>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlImage.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let media_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_key")) {
                        case (?media_key_field) ((switch (media_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let status : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status")) {
                        case (?status_field) ((switch (status_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title")) {
                        case (?title_field) ((switch (title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let unwound_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "unwound_url")) {
                        case (?unwound_url_field) ((switch (unwound_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url") else return null;
                    let ?url = ((switch (url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        end;
                        start;
                        description;
                        display_url;
                        expanded_url;
                        images;
                        media_key;
                        status;
                        title;
                        unwound_url;
                        url;
                    };
                };
                case _ null;
            };
    };
};
