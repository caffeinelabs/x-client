
import { type Media; JSON = Media } "./Media";

import { type Place; JSON = Place } "./Place";

import { type Poll; JSON = Poll } "./Poll";

import { type Topic; JSON = Topic } "./Topic";

import { type Tweet; JSON = Tweet } "./Tweet";

import { type User; JSON = User } "./User";

// Expansions.mo

module {
    // User-facing type: what application code uses
    public type Expansions = {
        media : ?[Media];
        places : ?[Place];
        polls : ?[Poll];
        topics : ?[Topic];
        tweets : ?[Tweet];
        users : ?[User];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Expansions type
        public type JSON = {
            media : ?[Media];
            places : ?[Place];
            polls : ?[Poll];
            topics : ?[Topic];
            tweets : ?[Tweet];
            users : ?[User];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Expansions) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Expansions = ?json;
    }
}
