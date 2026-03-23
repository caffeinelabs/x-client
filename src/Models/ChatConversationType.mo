
// ChatConversationType.mo
/// The type of conversation: 'direct' or 'group'.
/// Enum values: #direct, #group

module {
    // User-facing type: type-safe variants for application code
    public type ChatConversationType = {
        #direct;
        #group;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatConversationType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatConversationType) : JSON =
            switch (value) {
                case (#direct) "direct";
                case (#group) "group";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatConversationType =
            switch (json) {
                case "direct" ?#direct;
                case "group" ?#group;
                case _ null;
            };
    }
}
