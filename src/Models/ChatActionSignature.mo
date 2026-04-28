/// Cryptographic signature for a chat action.

import { type ChatMessageEventSignature; JSON = ChatMessageEventSignature } "./ChatMessageEventSignature";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatActionSignature.mo

module {
    public type ChatActionSignature = {
        /// Base64-encoded message event detail.
        encoded_message_event_detail : ?Text;
        message_event_signature : ?ChatMessageEventSignature;
        /// ID of the message being signed.
        message_id : ?Text;
        /// Cryptographic signature payload.
        signature_payload : ?Text;
    };

    public module JSON {
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
};
