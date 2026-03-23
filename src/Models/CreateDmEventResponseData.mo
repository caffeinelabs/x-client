
// CreateDmEventResponseData.mo

module {
    // User-facing type: what application code uses
    public type CreateDmEventResponseData = {
        /// Unique identifier of a DM conversation. This can either be a numeric string, or a pair of numeric strings separated by a '-' character in the case of one-on-one DM Conversations.
        dm_conversation_id : Text;
        /// Unique identifier of a DM Event.
        dm_event_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateDmEventResponseData type
        public type JSON = {
            dm_conversation_id : Text;
            dm_event_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateDmEventResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateDmEventResponseData = ?json;
    }
}
