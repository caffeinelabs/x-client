
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type DmEventAttachments; JSON = DmEventAttachments } "./DmEventAttachments";

import { type DmEventReferencedTweetsInner; JSON = DmEventReferencedTweetsInner } "./DmEventReferencedTweetsInner";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntityDm; JSON = UrlEntityDm } "./UrlEntityDm";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DmEvent.mo

module {
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

    public module JSON {
        public func toCandidValue(value : DmEvent) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.attachments) {
                case (?v__) List.add(buf, ("attachments", DmEventAttachments.toCandidValue(v__)));
                case null ();
            };
            switch (value.cashtags) {
                case (?v__) List.add(buf, ("cashtags", #Array(Array.map<CashtagEntity, Candid.Candid>(v__, CashtagEntity.toCandidValue))));
                case null ();
            };
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.dm_conversation_id) {
                case (?v__) List.add(buf, ("dm_conversation_id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("event_type", #Text(value.event_type)));
            switch (value.hashtags) {
                case (?v__) List.add(buf, ("hashtags", #Array(Array.map<HashtagEntity, Candid.Candid>(v__, HashtagEntity.toCandidValue))));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.mentions) {
                case (?v__) List.add(buf, ("mentions", #Array(Array.map<MentionEntity, Candid.Candid>(v__, MentionEntity.toCandidValue))));
                case null ();
            };
            switch (value.participant_ids) {
                case (?v__) List.add(buf, ("participant_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.referenced_tweets) {
                case (?v__) List.add(buf, ("referenced_tweets", #Array(Array.map<DmEventReferencedTweetsInner, Candid.Candid>(v__, DmEventReferencedTweetsInner.toCandidValue))));
                case null ();
            };
            switch (value.sender_id) {
                case (?v__) List.add(buf, ("sender_id", #Text(v__)));
                case null ();
            };
            switch (value.text_) {
                case (?v__) List.add(buf, ("text", #Text(v__)));
                case null ();
            };
            switch (value.urls) {
                case (?v__) List.add(buf, ("urls", #Array(Array.map<UrlEntityDm, Candid.Candid>(v__, UrlEntityDm.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DmEvent =
            switch (candid) {
                case (#Record(fields)) {
                    let attachments : ?DmEventAttachments = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "attachments")) {
                        case (?attachments_field) (DmEventAttachments.fromCandidValue(attachments_field.1));
                        case null null;
                    };
                    let cashtags : ?[CashtagEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cashtags")) {
                        case (?cashtags_field) ((switch (cashtags_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CashtagEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CashtagEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let dm_conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dm_conversation_id")) {
                        case (?dm_conversation_id_field) ((switch (dm_conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?event_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type") else return null;
                    let ?event_type = ((switch (event_type_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let hashtags : ?[HashtagEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hashtags")) {
                        case (?hashtags_field) ((switch (hashtags_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<HashtagEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = HashtagEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let mentions : ?[MentionEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "mentions")) {
                        case (?mentions_field) ((switch (mentions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<MentionEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = MentionEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let participant_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "participant_ids")) {
                        case (?participant_ids_field) ((switch (participant_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let referenced_tweets : ?[DmEventReferencedTweetsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "referenced_tweets")) {
                        case (?referenced_tweets_field) ((switch (referenced_tweets_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<DmEventReferencedTweetsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = DmEventReferencedTweetsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let sender_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sender_id")) {
                        case (?sender_id_field) ((switch (sender_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let text_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text")) {
                        case (?text__field) ((switch (text__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let urls : ?[UrlEntityDm] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "urls")) {
                        case (?urls_field) ((switch (urls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlEntityDm>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlEntityDm.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        attachments;
                        cashtags;
                        created_at;
                        dm_conversation_id;
                        event_type;
                        hashtags;
                        id;
                        mentions;
                        participant_ids;
                        referenced_tweets;
                        sender_id;
                        text_;
                        urls;
                    };
                };
                case _ null;
            };
    };
};
