
import { type SpaceState; JSON = SpaceState } "./SpaceState";

import { type SpaceTopicsInner; JSON = SpaceTopicsInner } "./SpaceTopicsInner";

// Space.mo
/// 

module {
    // User-facing type: what application code uses
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

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Space type
        public type JSON = {
            created_at : ?Text;
            creator_id : ?Text;
            ended_at : ?Text;
            host_ids : ?[Text];
            id : Text;
            invited_user_ids : ?[Text];
            is_ticketed : ?Bool;
            lang : ?Text;
            participant_count : ?Int;
            scheduled_start : ?Text;
            speaker_ids : ?[Text];
            started_at : ?Text;
            state : SpaceState.JSON;
            subscriber_count : ?Int;
            title : ?Text;
            topics : ?[SpaceTopicsInner];
            updated_at : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Space) : JSON = { value with
            state = SpaceState.toJSON(value.state);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Space {
            let ?state = SpaceState.fromJSON(json.state) else return null;
            ?{ json with
                state;
            }
        };
    }
}
