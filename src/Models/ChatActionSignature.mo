/// Cryptographic signature for a chat action.

import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatActionSignature.mo

module {
    /// The required-fields slice of ChatActionSignature — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatActionSignature as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        encoded_message_event_detail : ?Text;
        message_event_signature : ?ChatMessageEventSignature;
        message_id : ?Text;
        signature_payload : ?Text;
    };

    public type ChatActionSignature = Required and Optional;

    public module JSON {
        // `init` constructs a ChatActionSignature from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatActionSignature.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatActionSignature {
            let ?res = from_candid(to_candid(required)) : ?ChatActionSignature else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatActionSignature) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.encoded_message_event_detail) {
                case (?v__) List.add(buf, ("encoded_message_event_detail", #Text(v__)));
                case null ();
            };
            switch (value.message_event_signature) {
                case (?v__) List.add(buf, ("message_event_signature", ChatMessageEventSignature.toCandidValue(v__)));
                case null ();
            };
            switch (value.message_id) {
                case (?v__) List.add(buf, ("message_id", #Text(v__)));
                case null ();
            };
            switch (value.signature_payload) {
                case (?v__) List.add(buf, ("signature_payload", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatActionSignature =
            switch (candid) {
                case (#Record(fields)) {
                    let encoded_message_event_detail : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoded_message_event_detail")) {
                        case (?encoded_message_event_detail_field) ((switch (encoded_message_event_detail_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let message_event_signature : ?ChatMessageEventSignature = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_event_signature")) {
                        case (?message_event_signature_field) (ChatMessageEventSignature.fromCandidValue(message_event_signature_field.1));
                        case null null;
                    };
                    let message_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_id")) {
                        case (?message_id_field) ((switch (message_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signature_payload : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signature_payload")) {
                        case (?signature_payload_field) ((switch (signature_payload_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        encoded_message_event_detail;
                        message_event_signature;
                        message_id;
                        signature_payload;
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
