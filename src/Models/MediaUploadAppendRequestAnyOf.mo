
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadAppendRequestAnyOf.mo

module {
    /// The required-fields slice of MediaUploadAppendRequestAnyOf — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The file to upload.
        media : Blob;
        segment_index : MediaSegments;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express MediaUploadAppendRequestAnyOf as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type MediaUploadAppendRequestAnyOf = Required and Optional;

    public module JSON {
        // `init` constructs a MediaUploadAppendRequestAnyOf from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadAppendRequestAnyOf.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : MediaUploadAppendRequestAnyOf {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadAppendRequestAnyOf else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadAppendRequestAnyOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media", #Blob(value.media)));
            List.add(buf, ("segment_index", MediaSegments.toCandidValue(value.segment_index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadAppendRequestAnyOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?media_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media") else return null;
                    let ?media = ((switch (media_field.1) { case (#Blob(b)) ?b; case _ null })) else return null;
                    let ?segment_index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "segment_index") else return null;
                    let ?segment_index = (MediaSegments.fromCandidValue(segment_index_field.1)) else return null;
                    ?{
                        media;
                        segment_index;
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
