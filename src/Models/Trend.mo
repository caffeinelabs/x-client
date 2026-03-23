
// Trend.mo
/// A trend.

module {
    // User-facing type: what application code uses
    public type Trend = {
        /// Name of the trend.
        trend_name : ?Text;
        /// Number of Posts in this trend.
        tweet_count : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Trend type
        public type JSON = {
            trend_name : ?Text;
            tweet_count : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Trend) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Trend = ?json;
    }
}
