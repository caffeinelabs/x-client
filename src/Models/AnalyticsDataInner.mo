
import { type TimestampedMetrics; JSON = TimestampedMetrics } "./TimestampedMetrics";

// AnalyticsDataInner.mo

module {
    // User-facing type: what application code uses
    public type AnalyticsDataInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// Array containing metrics data along with the timestamps of their recording.
        timestamped_metrics : ?[TimestampedMetrics];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AnalyticsDataInner type
        public type JSON = {
            id : ?Text;
            timestamped_metrics : ?[TimestampedMetrics];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AnalyticsDataInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AnalyticsDataInner = ?json;
    }
}
