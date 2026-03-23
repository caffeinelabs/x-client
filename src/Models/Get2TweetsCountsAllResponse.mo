
import { type Get2TweetsCountsAllResponseMeta; JSON = Get2TweetsCountsAllResponseMeta } "./Get2TweetsCountsAllResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type SearchCount; JSON = SearchCount } "./SearchCount";

// Get2TweetsCountsAllResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsCountsAllResponse = {
        data : ?[SearchCount];
        errors : ?[Problem];
        meta : ?Get2TweetsCountsAllResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsCountsAllResponse type
        public type JSON = {
            data : ?[SearchCount];
            errors : ?[Problem];
            meta : ?Get2TweetsCountsAllResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsCountsAllResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsCountsAllResponse = ?json;
    }
}
