/// Request body for finalizing a Chat media upload.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadFinalizeRequest.mo

module {
    /// The required-fields slice of ChatMediaUploadFinalizeRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatMediaUploadFinalizeRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        conversation_id : ?Text;
        media_hash_key : ?Text;
        message_id : ?Text;
        num_parts : ?Text;
        ttl_msec : ?Text;
    };

    public type ChatMediaUploadFinalizeRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatMediaUploadFinalizeRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadFinalizeRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatMediaUploadFinalizeRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadFinalizeRequest else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
