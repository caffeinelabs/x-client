/// A user's public key with associated key recovery configuration.

import { type ChatJuiceboxConfig; JSON = ChatJuiceboxConfig } "./ChatJuiceboxConfig";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatPublicKey.mo

module {
    public type ChatPublicKey = {
        juicebox_config : ?ChatJuiceboxConfig;
        /// Identity public key (base64 encoded).
        public_key : ?Text;
        /// Signing public key (base64 encoded).
        signing_public_key : ?Text;
        /// Public key version.
        version : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatPublicKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.juicebox_config) {
                case (?v__) List.add(buf, ("juicebox_config", ChatJuiceboxConfig.toCandidValue(v__)));
                case null ();
            };
            switch (value.public_key) {
                case (?v__) List.add(buf, ("public_key", #Text(v__)));
                case null ();
            };
            switch (value.signing_public_key) {
                case (?v__) List.add(buf, ("signing_public_key", #Text(v__)));
                case null ();
            };
            switch (value.version) {
                case (?v__) List.add(buf, ("version", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatPublicKey =
            switch (candid) {
                case (#Record(fields)) {
                    let juicebox_config : ?ChatJuiceboxConfig = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "juicebox_config")) {
                        case (?juicebox_config_field) (ChatJuiceboxConfig.fromCandidValue(juicebox_config_field.1));
                        case null null;
                    };
                    let public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key")) {
                        case (?public_key_field) ((switch (public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let signing_public_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "signing_public_key")) {
                        case (?signing_public_key_field) ((switch (signing_public_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "version")) {
                        case (?version_field) ((switch (version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        juicebox_config;
                        public_key;
                        signing_public_key;
                        version;
                    };
                };
                case _ null;
            };
    };
};
