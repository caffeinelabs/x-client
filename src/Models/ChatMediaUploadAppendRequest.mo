
import { type ChatMediaUploadAppendRequestAnyOf; JSON = ChatMediaUploadAppendRequestAnyOf } "./ChatMediaUploadAppendRequestAnyOf";

import { type ChatMediaUploadAppendRequestAnyOf1; JSON = ChatMediaUploadAppendRequestAnyOf1 } "./ChatMediaUploadAppendRequestAnyOf1";

import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadAppendRequest.mo

module {
    /// The required-fields slice of ChatMediaUploadAppendRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// XChat conversation identifier for the upload.
        conversation_id : Text;
        /// The file to upload.
        media : Blob;
        /// Media hash key returned from initialize.
        media_hash_key : Text;
        segment_index : MediaSegments;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatMediaUploadAppendRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type ChatMediaUploadAppendRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatMediaUploadAppendRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadAppendRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatMediaUploadAppendRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadAppendRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadAppendRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("conversation_id", #Text(value.conversation_id)));
            List.add(buf, ("media", #Blob(value.media)));
            List.add(buf, ("media_hash_key", #Text(value.media_hash_key)));
            List.add(buf, ("segment_index", MediaSegments.toCandidValue(value.segment_index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadAppendRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?conversation_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id") else return null;
                    let ?conversation_id = ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?media_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media") else return null;
                    let ?media = ((switch (media_field.1) { case (#Blob(b)) ?b; case _ null })) else return null;
                    let ?media_hash_key_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_hash_key") else return null;
                    let ?media_hash_key = ((switch (media_hash_key_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?segment_index_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "segment_index") else return null;
                    let ?segment_index = (MediaSegments.fromCandidValue(segment_index_field.1)) else return null;
                    ?{
                        conversation_id;
                        media;
                        media_hash_key;
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
