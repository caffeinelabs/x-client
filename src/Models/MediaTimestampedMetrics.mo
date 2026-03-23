
import { type MediaMetrics; JSON = MediaMetrics } "./MediaMetrics";

// MediaTimestampedMetrics.mo

module {
    // User-facing type: what application code uses
    public type MediaTimestampedMetrics = {
        metrics : ?MediaMetrics;
        /// ISO8601 Time
        timestamp : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaTimestampedMetrics type
        public type JSON = {
            metrics : ?MediaMetrics;
            timestamp : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaTimestampedMetrics) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaTimestampedMetrics = ?json;
    }
}
