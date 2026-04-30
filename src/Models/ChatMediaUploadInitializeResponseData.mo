import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadInitializeResponseData.mo

module {
    public type ChatMediaUploadInitializeResponseData = {
        /// Conversation id associated with the upload.
        conversation_id : Text;
        /// Media hash key returned by XChat.
        media_hash_key : Text;
        /// Resume/session id for the upload.
        session_id : Text;
    };

    public module JSON {
        // `init` constructs a ChatMediaUploadInitializeResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadInitializeResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            conversation_id : Text;
            media_hash_key : Text;
            session_id : Text;
        }) : ChatMediaUploadInitializeResponseData {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadInitializeResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadInitializeResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("conversation_id", #Text(value.conversation_id)));
            List.add(buf, ("media_hash_key", #Text(value.media_hash_key)));
            List.add(buf, ("session_id", #Text(value.session_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadInitializeResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?conversation_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id") else return null;
                    let ?conversation_id = ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?media_hash_key_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_hash_key") else return null;
                    let ?media_hash_key = ((switch (media_hash_key_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?session_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "session_id") else return null;
                    let ?session_id = ((switch (session_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        conversation_id;
                        media_hash_key;
                        session_id;
                    };
                };
                case _ null;
            };
    };
};
