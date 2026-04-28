
import { type MediaSegments; JSON = MediaSegments } "./MediaSegments";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMediaUploadAppendRequestAnyOf.mo

module {
    public type ChatMediaUploadAppendRequestAnyOf = {
        /// XChat conversation identifier for the upload.
        conversation_id : Text;
        /// The file to upload.
        media : Blob;
        /// Media hash key returned from initialize.
        media_hash_key : Text;
        segment_index : MediaSegments;
    };

    public module JSON {
        public func toCandidValue(value : ChatMediaUploadAppendRequestAnyOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("conversation_id", #Text(value.conversation_id)));
            List.add(buf, ("media", #Blob(value.media)));
            List.add(buf, ("media_hash_key", #Text(value.media_hash_key)));
            List.add(buf, ("segment_index", MediaSegments.toCandidValue(value.segment_index)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadAppendRequestAnyOf =
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
};
