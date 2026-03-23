
// GetDirectMessagesEventsByParticipantIdExpansionsParameterInner.mo
/// Enum values: #attachments_media_keys, #participant_ids, #referenced_tweets_id, #sender_id

module {
    // User-facing type: type-safe variants for application code
    public type GetDirectMessagesEventsByParticipantIdExpansionsParameterInner = {
        #attachments_media_keys;
        #participant_ids;
        #referenced_tweets_id;
        #sender_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetDirectMessagesEventsByParticipantIdExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetDirectMessagesEventsByParticipantIdExpansionsParameterInner) : JSON =
            switch (value) {
                case (#attachments_media_keys) "attachments.media_keys";
                case (#participant_ids) "participant_ids";
                case (#referenced_tweets_id) "referenced_tweets.id";
                case (#sender_id) "sender_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetDirectMessagesEventsByParticipantIdExpansionsParameterInner =
            switch (json) {
                case "attachments.media_keys" ?#attachments_media_keys;
                case "participant_ids" ?#participant_ids;
                case "referenced_tweets.id" ?#referenced_tweets_id;
                case "sender_id" ?#sender_id;
                case _ null;
            };
    }
}
