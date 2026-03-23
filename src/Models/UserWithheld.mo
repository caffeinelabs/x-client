
import { type UserWithheldScope; JSON = UserWithheldScope } "./UserWithheldScope";

// UserWithheld.mo
/// Indicates withholding details for [withheld content](https://help.twitter.com/en/rules-and-policies/tweet-withheld-by-country).

module {
    // User-facing type: what application code uses
    public type UserWithheld = {
        /// Provides a list of countries where this content is not available.
        country_codes : [Text];
        scope : ?UserWithheldScope;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserWithheld type
        public type JSON = {
            country_codes : [Text];
            scope : ?UserWithheldScope.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserWithheld) : JSON = { value with
            scope = do ? { UserWithheldScope.toJSON(value.scope!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserWithheld {
            ?{ json with
                scope = do ? { UserWithheldScope.fromJSON(json.scope!)! };
            }
        };
    }
}
