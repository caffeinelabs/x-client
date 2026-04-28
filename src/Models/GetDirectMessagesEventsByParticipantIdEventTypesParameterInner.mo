import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetDirectMessagesEventsByParticipantIdEventTypesParameterInner.mo
/// Enum values: #messagecreate, #participantsjoin, #participantsleave

module {
    public type GetDirectMessagesEventsByParticipantIdEventTypesParameterInner = {
        #messagecreate;
        #participantsjoin;
        #participantsleave;
    };

    public module JSON {
        public func toCandidValue(value : GetDirectMessagesEventsByParticipantIdEventTypesParameterInner) : Candid.Candid =
            switch (value) {
                case (#messagecreate) #Text("MessageCreate");
                case (#participantsjoin) #Text("ParticipantsJoin");
                case (#participantsleave) #Text("ParticipantsLeave");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetDirectMessagesEventsByParticipantIdEventTypesParameterInner =
            switch (candid) {
                case (#Text("MessageCreate")) ?#messagecreate;
                case (#Text("ParticipantsJoin")) ?#participantsjoin;
                case (#Text("ParticipantsLeave")) ?#participantsleave;
                case _ null;
            };

        public func toText(value : GetDirectMessagesEventsByParticipantIdEventTypesParameterInner) : Text =
            switch (value) {
                case (#messagecreate) "MessageCreate";
                case (#participantsjoin) "ParticipantsJoin";
                case (#participantsleave) "ParticipantsLeave";
            };
    };
};
