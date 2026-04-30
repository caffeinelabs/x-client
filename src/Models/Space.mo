/// 

import { type SpaceState; JSON = SpaceState } "./SpaceState";

import { type SpaceTopicsInner; JSON = SpaceTopicsInner } "./SpaceTopicsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Space.mo

module {
    /// The required-fields slice of Space — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The unique identifier of this Space.
        id : Text;
        state : SpaceState;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Space as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        created_at : ?Text;
        creator_id : ?Text;
        ended_at : ?Text;
        host_ids : ?[Text];
        invited_user_ids : ?[Text];
        is_ticketed : ?Bool;
        lang : ?Text;
        participant_count : ?Int;
        scheduled_start : ?Text;
        speaker_ids : ?[Text];
        started_at : ?Text;
        subscriber_count : ?Int;
        title : ?Text;
        topics : ?[SpaceTopicsInner];
        updated_at : ?Text;
    };

    public type Space = Required and Optional;

    public module JSON {
        // `init` constructs a Space from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Space.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Space {
            let ?res = from_candid(to_candid(required)) : ?Space else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
