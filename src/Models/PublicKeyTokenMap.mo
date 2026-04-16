/// Juicebox configuration.

import { type PublicKeyTokenMapRealmsInner; JSON = PublicKeyTokenMapRealmsInner } "./PublicKeyTokenMapRealmsInner";

// PublicKeyTokenMap.mo

module {
    // User-facing type: what application code uses
    public type PublicKeyTokenMap = {
        /// Raw JSON for Juicebox SDK.
        key_store_token_map_json : ?Text;
        /// Maximum guess count for Juicebox.
        max_guess_count : ?Int;
        /// List of Juicebox realms.
        realms : ?[PublicKeyTokenMapRealmsInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PublicKeyTokenMap type
        public type JSON = {
            key_store_token_map_json : ?Text;
            max_guess_count : ?Int;
            realms : ?[PublicKeyTokenMapRealmsInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PublicKeyTokenMap) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PublicKeyTokenMap = ?json;
    }
}
