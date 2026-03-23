
import { type Expansions; JSON = Expansions } "./Expansions";

import { type LikeWithTweetAuthor; JSON = LikeWithTweetAuthor } "./LikeWithTweetAuthor";

import { type Problem; JSON = Problem } "./Problem";

// Get2LikesSample10StreamResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2LikesSample10StreamResponse = {
        data : ?LikeWithTweetAuthor;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2LikesSample10StreamResponse type
        public type JSON = {
            data : ?LikeWithTweetAuthor;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2LikesSample10StreamResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2LikesSample10StreamResponse = ?json;
    }
}
