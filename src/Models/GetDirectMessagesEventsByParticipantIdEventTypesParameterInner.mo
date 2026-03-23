
// GetDirectMessagesEventsByParticipantIdEventTypesParameterInner.mo
/// Enum values: #messagecreate, #participantsjoin, #participantsleave

module {
    // User-facing type: type-safe variants for application code
    public type GetDirectMessagesEventsByParticipantIdEventTypesParameterInner = {
        #messagecreate;
        #participantsjoin;
        #participantsleave;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetDirectMessagesEventsByParticipantIdEventTypesParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetDirectMessagesEventsByParticipantIdEventTypesParameterInner) : JSON =
            switch (value) {
                case (#messagecreate) "MessageCreate";
                case (#participantsjoin) "ParticipantsJoin";
                case (#participantsleave) "ParticipantsLeave";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetDirectMessagesEventsByParticipantIdEventTypesParameterInner =
            switch (json) {
                case "MessageCreate" ?#messagecreate;
                case "ParticipantsJoin" ?#participantsjoin;
                case "ParticipantsLeave" ?#participantsleave;
                case _ null;
            };
    }
}
