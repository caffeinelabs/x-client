/// Indicates withholding details for [withheld content](https://help.twitter.com/en/rules-and-policies/tweet-withheld-by-country).

import { type TweetWithheldScope; JSON = TweetWithheldScope } "./TweetWithheldScope";

// TweetWithheld.mo

module {
    // User-facing type: what application code uses
    public type TweetWithheld = {
        /// Indicates if the content is being withheld for on the basis of copyright infringement.
        copyright : Bool;
        /// Provides a list of countries where this content is not available.
        country_codes : [Text];
        scope : ?TweetWithheldScope;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetWithheld type
        public type JSON = {
            copyright : Bool;
            country_codes : [Text];
            scope : ?TweetWithheldScope.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetWithheld) : JSON = { value with
            scope = do ? { TweetWithheldScope.toJSON(value.scope!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetWithheld {
            ?{ json with
                scope = do ? { TweetWithheldScope.fromJSON(json.scope!)! };
            }
        };
    }
}
