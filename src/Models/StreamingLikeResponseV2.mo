
import { type Expansions; JSON = Expansions } "./Expansions";

import { type LikeWithTweetAuthor; JSON = LikeWithTweetAuthor } "./LikeWithTweetAuthor";

import { type Problem; JSON = Problem } "./Problem";

// StreamingLikeResponseV2.mo

module {
    // User-facing type: what application code uses
    public type StreamingLikeResponseV2 = {
        data : ?LikeWithTweetAuthor;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamingLikeResponseV2 type
        public type JSON = {
            data : ?LikeWithTweetAuthor;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamingLikeResponseV2) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamingLikeResponseV2 = ?json;
    }
}
