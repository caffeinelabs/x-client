
// GetChatConversationsExpansionsParameterInner.mo
/// Enum values: #admin_ids, #member_ids, #participant_ids

module {
    // User-facing type: type-safe variants for application code
    public type GetChatConversationsExpansionsParameterInner = {
        #admin_ids;
        #member_ids;
        #participant_ids;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetChatConversationsExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetChatConversationsExpansionsParameterInner) : JSON =
            switch (value) {
                case (#admin_ids) "admin_ids";
                case (#member_ids) "member_ids";
                case (#participant_ids) "participant_ids";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetChatConversationsExpansionsParameterInner =
            switch (json) {
                case "admin_ids" ?#admin_ids;
                case "member_ids" ?#member_ids;
                case "participant_ids" ?#participant_ids;
                case _ null;
            };
    }
}
