import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner.mo
/// Enum values: #attachments, #created_at, #dm_conversation_id, #entities, #event_type, #id, #participant_ids, #referenced_tweets, #sender_id, #text_

module {
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

    public module JSON {
        public func toCandidValue(value : GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#attachments) #Text("attachments");
                case (#created_at) #Text("created_at");
                case (#dm_conversation_id) #Text("dm_conversation_id");
                case (#entities) #Text("entities");
                case (#event_type) #Text("event_type");
                case (#id) #Text("id");
                case (#participant_ids) #Text("participant_ids");
                case (#referenced_tweets) #Text("referenced_tweets");
                case (#sender_id) #Text("sender_id");
                case (#text_) #Text("text");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner =
            switch (candid) {
                case (#Text("attachments")) ?#attachments;
                case (#Text("created_at")) ?#created_at;
                case (#Text("dm_conversation_id")) ?#dm_conversation_id;
                case (#Text("entities")) ?#entities;
                case (#Text("event_type")) ?#event_type;
                case (#Text("id")) ?#id;
                case (#Text("participant_ids")) ?#participant_ids;
                case (#Text("referenced_tweets")) ?#referenced_tweets;
                case (#Text("sender_id")) ?#sender_id;
                case (#Text("text")) ?#text_;
                case _ null;
            };

        public func toText(value : GetDirectMessagesEventsByParticipantIdDmEventFieldsParameterInner) : Text =
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
    };
};
