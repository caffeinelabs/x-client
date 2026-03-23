
import { type User; JSON = User } "./User";

// FollowActivityResponsePayload.mo

module {
    // User-facing type: what application code uses
    public type FollowActivityResponsePayload = {
        source : ?User;
        target : ?User;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FollowActivityResponsePayload type
        public type JSON = {
            source : ?User.JSON;
            target : ?User.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FollowActivityResponsePayload) : JSON = {
            source = do ? { User.toJSON(value.source!) };
            target = do ? { User.toJSON(value.target!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FollowActivityResponsePayload {
            ?{
                source = do ? { User.fromJSON(json.source!)! };
                target = do ? { User.fromJSON(json.target!)! };
            }
        };
    }
}
