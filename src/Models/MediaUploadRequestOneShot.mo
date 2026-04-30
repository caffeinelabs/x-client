
import { type MediaCategoryOneShot; JSON = MediaCategoryOneShot } "./MediaCategoryOneShot";

import { type MediaUploadRequestOneShotMedia; JSON = MediaUploadRequestOneShotMedia } "./MediaUploadRequestOneShotMedia";

import { type MediaUploadRequestOneShotMediaType; JSON = MediaUploadRequestOneShotMediaType } "./MediaUploadRequestOneShotMediaType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadRequestOneShot.mo

module {
    /// The required-fields slice of MediaUploadRequestOneShot — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        media : MediaUploadRequestOneShotMedia;
        media_category : MediaCategoryOneShot;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express MediaUploadRequestOneShot as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        additional_owners : ?[Text];
        media_type : ?MediaUploadRequestOneShotMediaType;
        shared_ : ?Bool;
    };

    public type MediaUploadRequestOneShot = Required and Optional;

    public module JSON {
        // `init` constructs a MediaUploadRequestOneShot from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadRequestOneShot.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : MediaUploadRequestOneShot {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadRequestOneShot else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadRequestOneShot) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.additional_owners) {
                case (?v__) List.add(buf, ("additional_owners", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            List.add(buf, ("media", MediaUploadRequestOneShotMedia.toCandidValue(value.media)));
            List.add(buf, ("media_category", MediaCategoryOneShot.toCandidValue(value.media_category)));
            switch (value.media_type) {
                case (?v__) List.add(buf, ("media_type", MediaUploadRequestOneShotMediaType.toCandidValue(v__)));
                case null ();
            };
            switch (value.shared_) {
                case (?v__) List.add(buf, ("shared", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadRequestOneShot =
            switch (candid) {
                case (#Record(fields)) {
                    let additional_owners : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "additional_owners")) {
                        case (?additional_owners_field) ((switch (additional_owners_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?media_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media") else return null;
                    let ?media = (MediaUploadRequestOneShotMedia.fromCandidValue(media_field.1)) else return null;
                    let ?media_category_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category") else return null;
                    let ?media_category = (MediaCategoryOneShot.fromCandidValue(media_category_field.1)) else return null;
                    let media_type : ?MediaUploadRequestOneShotMediaType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_type")) {
                        case (?media_type_field) (MediaUploadRequestOneShotMediaType.fromCandidValue(media_type_field.1));
                        case null null;
                    };
                    let shared_ : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "shared")) {
                        case (?shared__field) ((switch (shared__field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        additional_owners;
                        media;
                        media_category;
                        media_type;
                        shared_;
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
