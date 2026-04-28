/// Request body for finalizing a Chat media upload.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMediaUploadFinalizeRequest.mo

module {
    public type ChatMediaUploadFinalizeRequest = {
        /// XChat conversation identifier for the upload.
        conversation_id : ?Text;
        /// Media hash key returned from initialize.
        media_hash_key : ?Text;
        /// Optional message identifier associated with the upload.
        message_id : ?Text;
        /// Total number of uploaded parts as a numeric string.
        num_parts : ?Text;
        /// Optional TTL for the media in milliseconds.
        ttl_msec : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatMediaUploadFinalizeRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            switch (value.media_hash_key) {
                case (?v__) List.add(buf, ("media_hash_key", #Text(v__)));
                case null ();
            };
            switch (value.message_id) {
                case (?v__) List.add(buf, ("message_id", #Text(v__)));
                case null ();
            };
            switch (value.num_parts) {
                case (?v__) List.add(buf, ("num_parts", #Text(v__)));
                case null ();
            };
            switch (value.ttl_msec) {
                case (?v__) List.add(buf, ("ttl_msec", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadFinalizeRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_hash_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_hash_key")) {
                        case (?media_hash_key_field) ((switch (media_hash_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let message_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_id")) {
                        case (?message_id_field) ((switch (message_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let num_parts : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "num_parts")) {
                        case (?num_parts_field) ((switch (num_parts_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ttl_msec : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "ttl_msec")) {
                        case (?ttl_msec_field) ((switch (ttl_msec_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        conversation_id;
                        media_hash_key;
                        message_id;
                        num_parts;
                        ttl_msec;
                    };
                };
                case _ null;
            };
    };
};
