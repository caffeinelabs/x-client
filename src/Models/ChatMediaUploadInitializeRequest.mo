/// Request body for initializing a Chat media upload.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// ChatMediaUploadInitializeRequest.mo

module {
    public type ChatMediaUploadInitializeRequest = {
        /// XChat conversation identifier for the upload.
        conversation_id : ?Text;
        /// Total size of the media upload in bytes.
        total_bytes : ?Nat;
    };

    public module JSON {
        // `init` constructs a ChatMediaUploadInitializeRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadInitializeRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatMediaUploadInitializeRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadInitializeRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadInitializeRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            switch (value.total_bytes) {
                case (?v__) List.add(buf, ("total_bytes", #Nat(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadInitializeRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let total_bytes : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_bytes")) {
                        case (?total_bytes_field) ((switch (total_bytes_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    ?{
                        conversation_id;
                        total_bytes;
                    };
                };
                case _ null;
            };
    };
};
