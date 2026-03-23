
// PersonalizedTrend.mo
/// A trend.

module {
    // User-facing type: what application code uses
    public type PersonalizedTrend = {
        /// Category of this trend.
        category : ?Text;
        /// Number of posts pertaining to this trend.
        post_count : ?Int;
        /// Name of the trend.
        trend_name : ?Text;
        /// Time since this is trending.
        trending_since : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PersonalizedTrend type
        public type JSON = {
            category : ?Text;
            post_count : ?Int;
            trend_name : ?Text;
            trending_since : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PersonalizedTrend) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PersonalizedTrend = ?json;
    }
}
