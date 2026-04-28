
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";

import { type MediaUploadAppendRequestAnyOf; JSON = MediaUploadAppendRequestAnyOf } "./MediaUploadAppendRequestAnyOf";

import { type MediaUploadAppendRequestAnyOf1; JSON = MediaUploadAppendRequestAnyOf1 } "./MediaUploadAppendRequestAnyOf1";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaUploadAppendRequest.mo

module {
    public type MediaUploadAppendRequest = {
        /// The file to upload.
        media : Blob;
        segment_index : MediaSegments;
    };

    public module JSON {
        public func toCandidValue(value : MediaUploadAppendRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media", #Blob(value.media)));
            List.add(buf, ("segment_index", MediaSegments.toCandidValue(value.segment_index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadAppendRequest =
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
