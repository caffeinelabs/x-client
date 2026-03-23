
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// Get2TweetsSampleStreamResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2TweetsSampleStreamResponse = {
        data : ?Tweet;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2TweetsSampleStreamResponse type
        public type JSON = {
            data : ?Tweet.JSON;
            errors : ?[Problem];
            includes : ?Expansions;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2TweetsSampleStreamResponse) : JSON = { value with
            data = do ? { Tweet.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2TweetsSampleStreamResponse {
            ?{ json with
                data = do ? { Tweet.fromJSON(json.data!)! };
            }
        };
    }
}
