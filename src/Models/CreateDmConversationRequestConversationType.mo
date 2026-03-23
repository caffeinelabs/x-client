
// CreateDmConversationRequestConversationType.mo
/// The conversation type that is being created.
/// Enum values: #group

module {
    // User-facing type: type-safe variants for application code
    public type CreateDmConversationRequestConversationType = {
        #group;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateDmConversationRequestConversationType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateDmConversationRequestConversationType) : JSON =
            switch (value) {
                case (#group) "Group";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateDmConversationRequestConversationType =
            switch (json) {
                case "Group" ?#group;
                case _ null;
            };
    }
}
