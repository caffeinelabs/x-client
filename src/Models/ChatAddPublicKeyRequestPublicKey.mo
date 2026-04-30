/// Public key registration payload.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatAddPublicKeyRequestPublicKey.mo

module {
    public type ChatAddPublicKeyRequestPublicKey = {
        /// Signature over the identity public key.
        identity_public_key_signature : ?Text;
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Fingerprint of the identity public key.
        public_key_fingerprint : ?Text;
        /// Registration method for the public key.
        registration_method : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        /// Signature over the signing public key.
        signing_public_key_signature : ?Text;
    };

    public module JSON {
        // `init` constructs a ChatAddPublicKeyRequestPublicKey from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatAddPublicKeyRequestPublicKey.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatAddPublicKeyRequestPublicKey {
            let ?res = from_candid(to_candid(required)) : ?ChatAddPublicKeyRequestPublicKey else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatAddPublicKeyRequestPublicKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.identity_public_key_signature) {
                case (?v__) List.add(buf, ("identity_public_key_signature", #Text(v__)));
                case null ();
            };
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.public_key_fingerprint) {
                case (?v__) List.add(buf, ("public_key_fingerprint", #Text(v__)));
                case null ();
            };
            switch (value.registration_method) {
                case (?v__) List.add(buf, ("registration_method", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key_signature) {
                case (?v__) List.add(buf, ("signing_public_key_signature", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddPublicKeyRequestPublicKey =
            switch (candid) {
                case (#Record(fields)) {
                    let identity_public_key_signature : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "identity_public_key_signature")) {
                        case (?identity_public_key_signature_field) ((switch (identity_public_key_signature_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let public_key_fingerprint : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key_fingerprint")) {
                        case (?public_key_fingerprint_field) ((switch (public_key_fingerprint_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let registration_method : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "registration_method")) {
                        case (?registration_method_field) ((switch (registration_method_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key_signature : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key_signature")) {
                        case (?signing_public_key_signature_field) ((switch (signing_public_key_signature_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        identity_public_key_signature;
                        public_key;
                        public_key_fingerprint;
                        registration_method;
                        signing_public_key;
                        signing_public_key_signature;
                    };
                };
                case _ null;
            };
    };
};
