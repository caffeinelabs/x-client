
// GetTrendsByWoeidTrendFieldsParameterInner.mo
/// Enum values: #trend_name, #tweet_count

module {
    // User-facing type: type-safe variants for application code
    public type GetTrendsByWoeidTrendFieldsParameterInner = {
        #trend_name;
        #tweet_count;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetTrendsByWoeidTrendFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetTrendsByWoeidTrendFieldsParameterInner) : JSON =
            switch (value) {
                case (#trend_name) "trend_name";
                case (#tweet_count) "tweet_count";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetTrendsByWoeidTrendFieldsParameterInner =
            switch (json) {
                case "trend_name" ?#trend_name;
                case "tweet_count" ?#tweet_count;
                case _ null;
            };
    }
}
