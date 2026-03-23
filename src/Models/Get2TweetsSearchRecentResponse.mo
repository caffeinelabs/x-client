
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2TweetsSearchAllResponseMeta; JSON = Get2TweetsSearchAllResponseMeta } "./Get2TweetsSearchAllResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// Get2TweetsSearchRecentResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsSearchRecentResponse = {
        data : ?[Tweet];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2TweetsSearchAllResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsSearchRecentResponse type
        public type JSON = {
            data : ?[Tweet];
            errors : ?[Problem];
            includes : ?Expansions;
            meta : ?Get2TweetsSearchAllResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsSearchRecentResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsSearchRecentResponse = ?json;
    }
}
