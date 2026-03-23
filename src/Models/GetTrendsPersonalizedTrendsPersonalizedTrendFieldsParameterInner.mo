
// GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner.mo
/// Enum values: #category, #post_count, #trend_name, #trending_since

module {
    // User-facing type: type-safe variants for application code
    public type GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner = {
        #category;
        #post_count;
        #trend_name;
        #trending_since;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner) : JSON =
            switch (value) {
                case (#category) "category";
                case (#post_count) "post_count";
                case (#trend_name) "trend_name";
                case (#trending_since) "trending_since";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetTrendsPersonalizedTrendsPersonalizedTrendFieldsParameterInner =
            switch (json) {
                case "category" ?#category;
                case "post_count" ?#post_count;
                case "trend_name" ?#trend_name;
                case "trending_since" ?#trending_since;
                case _ null;
            };
    }
}
