/// Public key information for Chat encryption

import { type PublicKeyTokenMap; JSON = PublicKeyTokenMap } "./PublicKeyTokenMap";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PublicKey.mo

module {
    public type PublicKey = {
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        token_map : ?PublicKeyTokenMap;
        /// Public key version.
        version : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : PublicKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            switch (value.token_map) {
                case (?v__) List.add(buf, ("token_map", PublicKeyTokenMap.toCandidValue(v__)));
                case null ();
            };
            switch (value.version) {
                case (?v__) List.add(buf, ("version", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PublicKey =
            switch (candid) {
                case (#Record(fields)) {
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let token_map : ?PublicKeyTokenMap = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token_map")) {
                        case (?token_map_field) (PublicKeyTokenMap.fromCandidValue(token_map_field.1));
                        case null null;
                    };
                    let version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "version")) {
                        case (?version_field) ((switch (version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        public_key;
                        signing_public_key;
                        token_map;
                        version;
                    };
                };
                case _ null;
            };
    };
};
