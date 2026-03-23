
import { type Metrics; JSON = Metrics } "./Metrics";

// TimestampedMetrics.mo

module {
    // User-facing type: what application code uses
    public type TimestampedMetrics = {
        metrics : ?Metrics;
        /// ISO8601 Time
        timestamp : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TimestampedMetrics type
        public type JSON = {
            metrics : ?Metrics;
            timestamp : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TimestampedMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TimestampedMetrics = ?json;
    }
}
