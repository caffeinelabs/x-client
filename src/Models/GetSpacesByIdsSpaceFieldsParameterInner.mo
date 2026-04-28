import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetSpacesByIdsSpaceFieldsParameterInner.mo
/// Enum values: #created_at, #creator_id, #ended_at, #host_ids, #id, #invited_user_ids, #is_ticketed, #lang, #participant_count, #scheduled_start, #speaker_ids, #started_at, #state, #subscriber_count, #title, #topic_ids, #updated_at

module {
    public type GetSpacesByIdsSpaceFieldsParameterInner = {
        #created_at;
        #creator_id;
        #ended_at;
        #host_ids;
        #id;
        #invited_user_ids;
        #is_ticketed;
        #lang;
        #participant_count;
        #scheduled_start;
        #speaker_ids;
        #started_at;
        #state;
        #subscriber_count;
        #title;
        #topic_ids;
        #updated_at;
    };

    public module JSON {
        public func toCandidValue(value : GetSpacesByIdsSpaceFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#created_at) #Text("created_at");
                case (#creator_id) #Text("creator_id");
                case (#ended_at) #Text("ended_at");
                case (#host_ids) #Text("host_ids");
                case (#id) #Text("id");
                case (#invited_user_ids) #Text("invited_user_ids");
                case (#is_ticketed) #Text("is_ticketed");
                case (#lang) #Text("lang");
                case (#participant_count) #Text("participant_count");
                case (#scheduled_start) #Text("scheduled_start");
                case (#speaker_ids) #Text("speaker_ids");
                case (#started_at) #Text("started_at");
                case (#state) #Text("state");
                case (#subscriber_count) #Text("subscriber_count");
                case (#title) #Text("title");
                case (#topic_ids) #Text("topic_ids");
                case (#updated_at) #Text("updated_at");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetSpacesByIdsSpaceFieldsParameterInner =
            switch (candid) {
                case (#Text("created_at")) ?#created_at;
                case (#Text("creator_id")) ?#creator_id;
                case (#Text("ended_at")) ?#ended_at;
                case (#Text("host_ids")) ?#host_ids;
                case (#Text("id")) ?#id;
                case (#Text("invited_user_ids")) ?#invited_user_ids;
                case (#Text("is_ticketed")) ?#is_ticketed;
                case (#Text("lang")) ?#lang;
                case (#Text("participant_count")) ?#participant_count;
                case (#Text("scheduled_start")) ?#scheduled_start;
                case (#Text("speaker_ids")) ?#speaker_ids;
                case (#Text("started_at")) ?#started_at;
                case (#Text("state")) ?#state;
                case (#Text("subscriber_count")) ?#subscriber_count;
                case (#Text("title")) ?#title;
                case (#Text("topic_ids")) ?#topic_ids;
                case (#Text("updated_at")) ?#updated_at;
                case _ null;
            };

        public func toText(value : GetSpacesByIdsSpaceFieldsParameterInner) : Text =
            switch (value) {
                case (#created_at) "created_at";
                case (#creator_id) "creator_id";
                case (#ended_at) "ended_at";
                case (#host_ids) "host_ids";
                case (#id) "id";
                case (#invited_user_ids) "invited_user_ids";
                case (#is_ticketed) "is_ticketed";
                case (#lang) "lang";
                case (#participant_count) "participant_count";
                case (#scheduled_start) "scheduled_start";
                case (#speaker_ids) "speaker_ids";
                case (#started_at) "started_at";
                case (#state) "state";
                case (#subscriber_count) "subscriber_count";
                case (#title) "title";
                case (#topic_ids) "topic_ids";
                case (#updated_at) "updated_at";
            };
    };
};
