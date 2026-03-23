
import { type MediaTimestampedMetrics; JSON = MediaTimestampedMetrics } "./MediaTimestampedMetrics";

// MediaAnalyticsDataInner.mo

module {
    // User-facing type: what application code uses
    public type MediaAnalyticsDataInner = {
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        /// Array containing metrics data along with the timestamps of their recording.
        timestamped_metrics : ?[MediaTimestampedMetrics];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaAnalyticsDataInner type
        public type JSON = {
            media_key : ?Text;
            timestamped_metrics : ?[MediaTimestampedMetrics];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaAnalyticsDataInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaAnalyticsDataInner = ?json;
    }
}
