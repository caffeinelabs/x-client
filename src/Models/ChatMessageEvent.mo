/// An Chat message event with extracted envelope fields and the original encoded event.

import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMessageEvent.mo

module {
    /// The required-fields slice of ChatMessageEvent — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Base64-encoded MessageEvent for client decoding.
        encoded_event : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatMessageEvent as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        conversation_id : ?Text;
        conversation_token : ?Text;
        created_at_msec : ?Text;
        id : ?Text;
        is_trusted : ?Bool;
        message_event_signature : ?ChatMessageEventSignature;
        previous_sequence_id : ?Text;
        sender_id : ?Text;
        sequence_id : ?Text;
    };

    public type ChatMessageEvent = Required and Optional;

    public module JSON {
        // `init` constructs a ChatMessageEvent from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMessageEvent.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatMessageEvent {
            let ?res = from_candid(to_candid(required)) : ?ChatMessageEvent else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMessageEvent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            switch (value.conversation_token) {
                case (?v__) List.add(buf, ("conversation_token", #Text(v__)));
                case null ();
            };
            switch (value.created_at_msec) {
                case (?v__) List.add(buf, ("created_at_msec", #Text(v__)));
                case null ();
            };
            List.add(buf, ("encoded_event", #Text(value.encoded_event)));
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.is_trusted) {
                case (?v__) List.add(buf, ("is_trusted", #Bool(v__)));
                case null ();
            };
            switch (value.message_event_signature) {
                case (?v__) List.add(buf, ("message_event_signature", ChatMessageEventSignature.toCandidValue(v__)));
                case null ();
            };
            switch (value.previous_sequence_id) {
                case (?v__) List.add(buf, ("previous_sequence_id", #Text(v__)));
                case null ();
            };
            switch (value.sender_id) {
                case (?v__) List.add(buf, ("sender_id", #Text(v__)));
                case null ();
            };
            switch (value.sequence_id) {
                case (?v__) List.add(buf, ("sequence_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMessageEvent =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let conversation_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_token")) {
                        case (?conversation_token_field) ((switch (conversation_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let created_at_msec : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at_msec")) {
                        case (?created_at_msec_field) ((switch (created_at_msec_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?encoded_event_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoded_event") else return null;
                    let ?encoded_event = ((switch (encoded_event_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let is_trusted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "is_trusted")) {
                        case (?is_trusted_field) ((switch (is_trusted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let message_event_signature : ?ChatMessageEventSignature = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_event_signature")) {
                        case (?message_event_signature_field) (ChatMessageEventSignature.fromCandidValue(message_event_signature_field.1));
                        case null null;
                    };
                    let previous_sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "previous_sequence_id")) {
                        case (?previous_sequence_id_field) ((switch (previous_sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let sender_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sender_id")) {
                        case (?sender_id_field) ((switch (sender_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sequence_id")) {
                        case (?sequence_id_field) ((switch (sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        conversation_id;
                        conversation_token;
                        created_at_msec;
                        encoded_event;
                        id;
                        is_trusted;
                        message_event_signature;
                        previous_sequence_id;
                        sender_id;
                        sequence_id;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
