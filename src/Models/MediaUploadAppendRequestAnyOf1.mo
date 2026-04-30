
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadAppendRequestAnyOf1.mo

module {
    public type MediaUploadAppendRequestAnyOf1 = {
        /// The file to upload.
        media : Blob;
        segment_index : MediaSegments;
    };

    public module JSON {
        // `init` constructs a MediaUploadAppendRequestAnyOf1 from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadAppendRequestAnyOf1.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            media : Blob;
            segment_index : MediaSegments;
        }) : MediaUploadAppendRequestAnyOf1 {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadAppendRequestAnyOf1 else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadAppendRequestAnyOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media", #Blob(value.media)));
            List.add(buf, ("segment_index", MediaSegments.toCandidValue(value.segment_index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadAppendRequestAnyOf1 =
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
};
