/// 

import { type SpaceState; JSON = SpaceState } "./SpaceState";

import { type SpaceTopicsInner; JSON = SpaceTopicsInner } "./SpaceTopicsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Space.mo

module {
    public type Space = {
        /// Creation time of the Space.
        created_at : ?Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        creator_id : ?Text;
        /// End time of the Space.
        ended_at : ?Text;
        /// The user ids for the hosts of the Space.
        host_ids : ?[Text];
        /// The unique identifier of this Space.
        id : Text;
        /// An array of user ids for people who were invited to a Space.
        invited_user_ids : ?[Text];
        /// Denotes if the Space is a ticketed Space.
        is_ticketed : ?Bool;
        /// The language of the Space.
        lang : ?Text;
        /// The number of participants in a Space.
        participant_count : ?Int;
        /// A date time stamp for when a Space is scheduled to begin.
        scheduled_start : ?Text;
        /// An array of user ids for people who were speakers in a Space.
        speaker_ids : ?[Text];
        /// When the Space was started as a date string.
        started_at : ?Text;
        state : SpaceState;
        /// The number of people who have either purchased a ticket or set a reminder for this Space.
        subscriber_count : ?Int;
        /// The title of the Space.
        title : ?Text;
        /// The topics of a Space, as selected by its creator.
        topics : ?[SpaceTopicsInner];
        /// When the Space was last updated.
        updated_at : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : Space) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.creator_id) {
                case (?v__) List.add(buf, ("creator_id", #Text(v__)));
                case null ();
            };
            switch (value.ended_at) {
                case (?v__) List.add(buf, ("ended_at", #Text(v__)));
                case null ();
            };
            switch (value.host_ids) {
                case (?v__) List.add(buf, ("host_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.invited_user_ids) {
                case (?v__) List.add(buf, ("invited_user_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.is_ticketed) {
                case (?v__) List.add(buf, ("is_ticketed", #Bool(v__)));
                case null ();
            };
            switch (value.lang) {
                case (?v__) List.add(buf, ("lang", #Text(v__)));
                case null ();
            };
            switch (value.participant_count) {
                case (?v__) List.add(buf, ("participant_count", #Int(v__)));
                case null ();
            };
            switch (value.scheduled_start) {
                case (?v__) List.add(buf, ("scheduled_start", #Text(v__)));
                case null ();
            };
            switch (value.speaker_ids) {
                case (?v__) List.add(buf, ("speaker_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.started_at) {
                case (?v__) List.add(buf, ("started_at", #Text(v__)));
                case null ();
            };
            List.add(buf, ("state", SpaceState.toCandidValue(value.state)));
            switch (value.subscriber_count) {
                case (?v__) List.add(buf, ("subscriber_count", #Int(v__)));
                case null ();
            };
            switch (value.title) {
                case (?v__) List.add(buf, ("title", #Text(v__)));
                case null ();
            };
            switch (value.topics) {
                case (?v__) List.add(buf, ("topics", #Array(Array.map<SpaceTopicsInner, Candid.Candid>(v__, SpaceTopicsInner.toCandidValue))));
                case null ();
            };
            switch (value.updated_at) {
                case (?v__) List.add(buf, ("updated_at", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Space =
            switch (candid) {
                case (#Record(fields)) {
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let creator_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "creator_id")) {
                        case (?creator_id_field) ((switch (creator_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ended_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "ended_at")) {
                        case (?ended_at_field) ((switch (ended_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let host_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "host_ids")) {
                        case (?host_ids_field) ((switch (host_ids_field.1) {
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
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let invited_user_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "invited_user_ids")) {
                        case (?invited_user_ids_field) ((switch (invited_user_ids_field.1) {
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
                    let is_ticketed : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "is_ticketed")) {
                        case (?is_ticketed_field) ((switch (is_ticketed_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let lang : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "lang")) {
                        case (?lang_field) ((switch (lang_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let participant_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "participant_count")) {
                        case (?participant_count_field) ((switch (participant_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let scheduled_start : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scheduled_start")) {
                        case (?scheduled_start_field) ((switch (scheduled_start_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let speaker_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "speaker_ids")) {
                        case (?speaker_ids_field) ((switch (speaker_ids_field.1) {
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
                    let started_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "started_at")) {
                        case (?started_at_field) ((switch (started_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?state_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "state") else return null;
                    let ?state = (SpaceState.fromCandidValue(state_field.1)) else return null;
                    let subscriber_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "subscriber_count")) {
                        case (?subscriber_count_field) ((switch (subscriber_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title")) {
                        case (?title_field) ((switch (title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let topics : ?[SpaceTopicsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "topics")) {
                        case (?topics_field) ((switch (topics_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<SpaceTopicsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = SpaceTopicsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let updated_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "updated_at")) {
                        case (?updated_at_field) ((switch (updated_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        created_at;
                        creator_id;
                        ended_at;
                        host_ids;
                        id;
                        invited_user_ids;
                        is_ticketed;
                        lang;
                        participant_count;
                        scheduled_start;
                        speaker_ids;
                        started_at;
                        state;
                        subscriber_count;
                        title;
                        topics;
                        updated_at;
                    };
                };
                case _ null;
            };
    };
};
