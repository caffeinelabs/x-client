/// Message event signature for verification.

import { type ChatMessageSigningKeyInfo; JSON = ChatMessageSigningKeyInfo } "./ChatMessageSigningKeyInfo";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMessageEventSignature.mo

module {
    public type ChatMessageEventSignature = {
        /// List of signing key information for message verification.
        message_signing_key_info_list : ?[ChatMessageSigningKeyInfo];
        /// The version of the public key used for signing.
        public_key_version : ?Text;
        /// The signature of the message event.
        signature : ?Text;
        /// The version of the signature algorithm.
        signature_version : ?Text;
        /// The public key used for signing.
        signing_public_key : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatMessageEventSignature) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.message_signing_key_info_list) {
                case (?v__) List.add(buf, ("message_signing_key_info_list", #Array(Array.map<ChatMessageSigningKeyInfo, Candid.Candid>(v__, ChatMessageSigningKeyInfo.toCandidValue))));
                case null ();
            };
            switch (value.public_key_version) {
                case (?v__) List.add(buf, ("public_key_version", #Text(v__)));
                case null ();
            };
            switch (value.signature) {
                case (?v__) List.add(buf, ("signature", #Text(v__)));
                case null ();
            };
            switch (value.signature_version) {
                case (?v__) List.add(buf, ("signature_version", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMessageEventSignature =
            switch (candid) {
                case (#Record(fields)) {
                    let message_signing_key_info_list : ?[ChatMessageSigningKeyInfo] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_signing_key_info_list")) {
                        case (?message_signing_key_info_list_field) ((switch (message_signing_key_info_list_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatMessageSigningKeyInfo>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatMessageSigningKeyInfo.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let public_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_version")) {
                        case (?public_key_version_field) ((switch (public_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signature : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signature")) {
                        case (?signature_field) ((switch (signature_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signature_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signature_version")) {
                        case (?signature_version_field) ((switch (signature_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        message_signing_key_info_list;
                        public_key_version;
                        signature;
                        signature_version;
                        signing_public_key;
                    };
                };
                case _ null;
            };
    };
};
