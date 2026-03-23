
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type DmEventAttachments; JSON = DmEventAttachments } "./DmEventAttachments";

import { type DmEventReferencedTweetsInner; JSON = DmEventReferencedTweetsInner } "./DmEventReferencedTweetsInner";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntityDm; JSON = UrlEntityDm } "./UrlEntityDm";

// DmEvent.mo

module {
    // User-facing type: what application code uses
    public type DmEvent = {
        attachments : ?DmEventAttachments;
        cashtags : ?[CashtagEntity];
        created_at : ?Text;
        /// Unique identifier of a DM conversation. This can either be a numeric string, or a pair of numeric strings separated by a '-' character in the case of one-on-one DM Conversations.
        dm_conversation_id : ?Text;
        event_type : Text;
        hashtags : ?[HashtagEntity];
        /// Unique identifier of a DM Event.
        id : Text;
        mentions : ?[MentionEntity];
        /// A list of participants for a ParticipantsJoin or ParticipantsLeave event_type.
        participant_ids : ?[Text];
        /// A list of Posts this DM refers to.
        referenced_tweets : ?[DmEventReferencedTweetsInner];
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        sender_id : ?Text;
        text_ : ?Text;
        urls : ?[UrlEntityDm];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DmEvent type
        public type JSON = {
            attachments : ?DmEventAttachments;
            cashtags : ?[CashtagEntity];
            created_at : ?Text;
            dm_conversation_id : ?Text;
            event_type : Text;
            hashtags : ?[HashtagEntity];
            id : Text;
            mentions : ?[MentionEntity];
            participant_ids : ?[Text];
            referenced_tweets : ?[DmEventReferencedTweetsInner];
            sender_id : ?Text;
            text_ : ?Text;
            urls : ?[UrlEntityDm];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DmEvent) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DmEvent = ?json;
    }
}
