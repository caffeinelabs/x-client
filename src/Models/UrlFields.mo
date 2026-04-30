/// Represent the portion of text recognized as a URL.

import { type UrlImage; JSON = UrlImage } "./UrlImage";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// UrlFields.mo

module {
    /// The required-fields slice of UrlFields — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// A validly formatted URL.
        url : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UrlFields as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        description : ?Text;
        display_url : ?Text;
        expanded_url : ?Text;
        images : ?[UrlImage];
        media_key : ?Text;
        status : ?Nat;
        title : ?Text;
        unwound_url : ?Text;
    };

    public type UrlFields = Required and Optional;

    public module JSON {
        // `init` constructs a UrlFields from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UrlFields.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UrlFields {
            let ?res = from_candid(to_candid(required)) : ?UrlFields else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UrlFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
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

        public func fromCandidValue(candid : Candid.Candid) : ?UrlFields =
            switch (candid) {
                case (#Record(fields)) {
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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
