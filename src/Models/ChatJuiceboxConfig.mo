
import { type ChatJuiceboxConfigTokenMapInner; JSON = ChatJuiceboxConfigTokenMapInner } "./ChatJuiceboxConfigTokenMapInner";

// ChatJuiceboxConfig.mo
/// Key recovery configuration for Juicebox-based key storage.

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatJuiceboxConfig type
        public type JSON = {
            key_store_token_map_json : ?Text;
            max_guess_count : ?Int;
            realm_state_string : ?Text;
            recover_threshold : ?Int;
            register_threshold : ?Int;
            token_map : ?[ChatJuiceboxConfigTokenMapInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatJuiceboxConfig) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatJuiceboxConfig = ?json;
    }
}
