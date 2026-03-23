
import { type ChatJuiceboxConfigTokenMapInnerValue; JSON = ChatJuiceboxConfigTokenMapInnerValue } "./ChatJuiceboxConfigTokenMapInnerValue";

// ChatJuiceboxConfigTokenMapInner.mo

module {
    // User-facing type: what application code uses
    public type ChatJuiceboxConfigTokenMapInner = {
        /// Realm identifier.
        key : ?Text;
        value : ?ChatJuiceboxConfigTokenMapInnerValue;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatJuiceboxConfigTokenMapInner type
        public type JSON = {
            key : ?Text;
            value : ?ChatJuiceboxConfigTokenMapInnerValue;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatJuiceboxConfigTokenMapInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatJuiceboxConfigTokenMapInner = ?json;
    }
}
