
// GetSpacesByIdsSpaceFieldsParameterInner.mo
/// Enum values: #created_at, #creator_id, #ended_at, #host_ids, #id, #invited_user_ids, #is_ticketed, #lang, #participant_count, #scheduled_start, #speaker_ids, #started_at, #state, #subscriber_count, #title, #topic_ids, #updated_at

module {
    // User-facing type: type-safe variants for application code
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetSpacesByIdsSpaceFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetSpacesByIdsSpaceFieldsParameterInner) : JSON =
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

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetSpacesByIdsSpaceFieldsParameterInner =
            switch (json) {
                case "created_at" ?#created_at;
                case "creator_id" ?#creator_id;
                case "ended_at" ?#ended_at;
                case "host_ids" ?#host_ids;
                case "id" ?#id;
                case "invited_user_ids" ?#invited_user_ids;
                case "is_ticketed" ?#is_ticketed;
                case "lang" ?#lang;
                case "participant_count" ?#participant_count;
                case "scheduled_start" ?#scheduled_start;
                case "speaker_ids" ?#speaker_ids;
                case "started_at" ?#started_at;
                case "state" ?#state;
                case "subscriber_count" ?#subscriber_count;
                case "title" ?#title;
                case "topic_ids" ?#topic_ids;
                case "updated_at" ?#updated_at;
                case _ null;
            };
    }
}
