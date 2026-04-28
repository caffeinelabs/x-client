/// An Chat message event with extracted envelope fields and the original encoded event.

import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMessageEvent.mo

module {
    public type ChatMessageEvent = {
        /// The conversation ID this message belongs to.
        conversation_id : ?Text;
        /// The conversation token for this message.
        conversation_token : ?Text;
        /// The creation timestamp in milliseconds.
        created_at_msec : ?Text;
        /// Base64-encoded MessageEvent for client decoding.
        encoded_event : Text;
        /// The unique identifier for this message event (message_id).
        id : ?Text;
        /// Whether the message is from a trusted source.
        is_trusted : ?Bool;
        message_event_signature : ?ChatMessageEventSignature;
        /// The sequence ID of the previous message.
        previous_sequence_id : ?Text;
        /// The user ID of the message sender.
        sender_id : ?Text;
        /// The sequence identifier for ordering messages.
        sequence_id : ?Text;
    };

    public module JSON {
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
};
