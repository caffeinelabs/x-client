
import { type Expansions; JSON = Expansions } "./Expansions";

import { type FilteredStreamingTweetResponseMatchingRulesInner; JSON = FilteredStreamingTweetResponseMatchingRulesInner } "./FilteredStreamingTweetResponseMatchingRulesInner";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";

// FilteredStreamingTweetResponse.mo
/// A Tweet or error that can be returned by the streaming Tweet API. The values returned with a successful streamed Tweet includes the user provided rules that the Tweet matched.

module {
    // User-facing type: what application code uses
    public type FilteredStreamingTweetResponse = {
        data : ?Tweet;
        errors : ?[Problem];
        includes : ?Expansions;
        /// The list of rules which matched the Tweet
        matching_rules : ?[FilteredStreamingTweetResponseMatchingRulesInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FilteredStreamingTweetResponse type
        public type JSON = {
            data : ?Tweet.JSON;
            errors : ?[Problem];
            includes : ?Expansions;
            matching_rules : ?[FilteredStreamingTweetResponseMatchingRulesInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FilteredStreamingTweetResponse) : JSON = { value with
            data = do ? { Tweet.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FilteredStreamingTweetResponse {
            ?{ json with
                data = do ? { Tweet.fromJSON(json.data!)! };
            }
        };
    }
}
