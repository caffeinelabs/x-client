import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetDirectMessagesEventsByParticipantIdExpansionsParameterInner.mo
/// Enum values: #attachments_media_keys, #participant_ids, #referenced_tweets_id, #sender_id

module {
    public type GetDirectMessagesEventsByParticipantIdExpansionsParameterInner = {
        #attachments_media_keys;
        #participant_ids;
        #referenced_tweets_id;
        #sender_id;
    };

    public module JSON {
        public func toCandidValue(value : GetDirectMessagesEventsByParticipantIdExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#attachments_media_keys) #Text("attachments.media_keys");
                case (#participant_ids) #Text("participant_ids");
                case (#referenced_tweets_id) #Text("referenced_tweets.id");
                case (#sender_id) #Text("sender_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetDirectMessagesEventsByParticipantIdExpansionsParameterInner =
            switch (candid) {
                case (#Text("attachments.media_keys")) ?#attachments_media_keys;
                case (#Text("participant_ids")) ?#participant_ids;
                case (#Text("referenced_tweets.id")) ?#referenced_tweets_id;
                case (#Text("sender_id")) ?#sender_id;
                case _ null;
            };

        public func toText(value : GetDirectMessagesEventsByParticipantIdExpansionsParameterInner) : Text =
            switch (value) {
                case (#attachments_media_keys) "attachments.media_keys";
                case (#participant_ids) "participant_ids";
                case (#referenced_tweets_id) "referenced_tweets.id";
                case (#sender_id) "sender_id";
            };
    };
};
