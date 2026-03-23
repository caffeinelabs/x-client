
import { type FollowActivityResponsePayload; JSON = FollowActivityResponsePayload } "./FollowActivityResponsePayload";

import { type NewsActivityResponsePayload; JSON = NewsActivityResponsePayload } "./NewsActivityResponsePayload";

import { type ProfileUpdateActivityResponsePayload; JSON = ProfileUpdateActivityResponsePayload } "./ProfileUpdateActivityResponsePayload";

import { type User; JSON = User } "./User";

// ActivityStreamingResponsePayload.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type ActivityStreamingResponsePayload = {
        #ProfileUpdateActivityResponsePayload : ProfileUpdateActivityResponsePayload;
        #NewsActivityResponsePayload : NewsActivityResponsePayload;
        #FollowActivityResponsePayload : FollowActivityResponsePayload;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : ActivityStreamingResponsePayload) : Text =
            switch (value) {
                case (#ProfileUpdateActivityResponsePayload(v)) Runtime.unreachable();
                case (#NewsActivityResponsePayload(v)) Runtime.unreachable();
                case (#FollowActivityResponsePayload(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ActivityStreamingResponsePayload type
        public type JSON = {
            #ProfileUpdateActivityResponsePayload : ProfileUpdateActivityResponsePayload;
            #NewsActivityResponsePayload : NewsActivityResponsePayload;
            #FollowActivityResponsePayload : FollowActivityResponsePayload;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ActivityStreamingResponsePayload) : JSON =
            switch (value) {
                case (#ProfileUpdateActivityResponsePayload(v)) #ProfileUpdateActivityResponsePayload(v);
                case (#NewsActivityResponsePayload(v)) #NewsActivityResponsePayload(v);
                case (#FollowActivityResponsePayload(v)) #FollowActivityResponsePayload(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ActivityStreamingResponsePayload =
            switch (json) {
                case (#ProfileUpdateActivityResponsePayload(v)) ?#ProfileUpdateActivityResponsePayload(v);
                case (#NewsActivityResponsePayload(v)) ?#NewsActivityResponsePayload(v);
                case (#FollowActivityResponsePayload(v)) ?#FollowActivityResponsePayload(v);
            };
    }
}
