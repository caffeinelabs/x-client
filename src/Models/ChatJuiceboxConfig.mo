/// Key recovery configuration for Juicebox-based key storage.

import { type ChatJuiceboxConfigTokenMapInner; JSON = ChatJuiceboxConfigTokenMapInner } "./ChatJuiceboxConfigTokenMapInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatJuiceboxConfig.mo

module {
    public type ChatJuiceboxConfig = {
        /// Raw JSON for key recovery configuration.
        key_store_token_map_json : ?Text;
        /// Maximum guess count for key recovery.
        max_guess_count : ?Int;
        /// Serialized realm state for key recovery.
        realm_state_string : ?Text;
        /// Threshold required to recover the key.
        recover_threshold : ?Int;
        /// Threshold required to register the key.
        register_threshold : ?Int;
        /// Per-realm auth tokens for key recovery.
        token_map : ?[ChatJuiceboxConfigTokenMapInner];
    };

    public module JSON {
        public func toCandidValue(value : ChatJuiceboxConfig) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.key_store_token_map_json) {
                case (?v__) List.add(buf, ("key_store_token_map_json", #Text(v__)));
                case null ();
            };
            switch (value.max_guess_count) {
                case (?v__) List.add(buf, ("max_guess_count", #Int(v__)));
                case null ();
            };
            switch (value.realm_state_string) {
                case (?v__) List.add(buf, ("realm_state_string", #Text(v__)));
                case null ();
            };
            switch (value.recover_threshold) {
                case (?v__) List.add(buf, ("recover_threshold", #Int(v__)));
                case null ();
            };
            switch (value.register_threshold) {
                case (?v__) List.add(buf, ("register_threshold", #Int(v__)));
                case null ();
            };
            switch (value.token_map) {
                case (?v__) List.add(buf, ("token_map", #Array(Array.map<ChatJuiceboxConfigTokenMapInner, Candid.Candid>(v__, ChatJuiceboxConfigTokenMapInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatJuiceboxConfig =
            switch (candid) {
                case (#Record(fields)) {
                    let key_store_token_map_json : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "key_store_token_map_json")) {
                        case (?key_store_token_map_json_field) ((switch (key_store_token_map_json_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let max_guess_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "max_guess_count")) {
                        case (?max_guess_count_field) ((switch (max_guess_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let realm_state_string : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "realm_state_string")) {
                        case (?realm_state_string_field) ((switch (realm_state_string_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let recover_threshold : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "recover_threshold")) {
                        case (?recover_threshold_field) ((switch (recover_threshold_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let register_threshold : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "register_threshold")) {
                        case (?register_threshold_field) ((switch (register_threshold_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let token_map : ?[ChatJuiceboxConfigTokenMapInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "token_map")) {
                        case (?token_map_field) ((switch (token_map_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatJuiceboxConfigTokenMapInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatJuiceboxConfigTokenMapInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        key_store_token_map_json;
                        max_guess_count;
                        realm_state_string;
                        recover_threshold;
                        register_threshold;
                        token_map;
                    };
                };
                case _ null;
            };
    };
};
