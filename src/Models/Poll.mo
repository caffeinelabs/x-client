/// Represent a Poll attached to a Tweet.

import { type PollOption; JSON = PollOption } "./PollOption";

import { type PollVotingStatus; JSON = PollVotingStatus } "./PollVotingStatus";

import Int "mo:core/Int";

// Poll.mo

module {
    // User-facing type: what application code uses
    public type Poll = {
        duration_minutes : ?Nat;
        end_datetime : ?Text;
        /// Unique identifier of this poll.
        id : Text;
        options : [PollOption];
        voting_status : ?PollVotingStatus;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Poll type
        public type JSON = {
            duration_minutes : ?Int;
            end_datetime : ?Text;
            id : Text;
            options : [PollOption];
            voting_status : ?PollVotingStatus.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Poll) : JSON = { value with
            voting_status = do ? { PollVotingStatus.toJSON(value.voting_status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Poll {
            ?{ json with
                duration_minutes = switch (json.duration_minutes) { case (?v) if (v < 0) null else ?Int.abs(v); case null null };
                voting_status = do ? { PollVotingStatus.fromJSON(json.voting_status!)! };
            }
        };
    }
}
