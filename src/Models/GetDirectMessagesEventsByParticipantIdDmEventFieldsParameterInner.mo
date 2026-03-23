
// GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner.mo
/// Enum values: #attachments, #created_at, #dm_conversation_id, #entities, #event_type, #id, #participant_ids, #referenced_tweets, #sender_id, #text_

module {
    // User-facing type: type-safe variants for application code
    public type GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner = {
        #attachments;
        #created_at;
        #dm_conversation_id;
        #entities;
        #event_type;
        #id;
        #participant_ids;
        #referenced_tweets;
        #sender_id;
        #text_;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner) : JSON =
            switch (value) {
                case (#attachments) "attachments";
                case (#created_at) "created_at";
                case (#dm_conversation_id) "dm_conversation_id";
                case (#entities) "entities";
                case (#event_type) "event_type";
                case (#id) "id";
                case (#participant_ids) "participant_ids";
                case (#referenced_tweets) "referenced_tweets";
                case (#sender_id) "sender_id";
                case (#text_) "text";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner =
            switch (json) {
                case "attachments" ?#attachments;
                case "created_at" ?#created_at;
                case "dm_conversation_id" ?#dm_conversation_id;
                case "entities" ?#entities;
                case "event_type" ?#event_type;
                case "id" ?#id;
                case "participant_ids" ?#participant_ids;
                case "referenced_tweets" ?#referenced_tweets;
                case "sender_id" ?#sender_id;
                case "text" ?#text_;
                case _ null;
            };
    }
}
