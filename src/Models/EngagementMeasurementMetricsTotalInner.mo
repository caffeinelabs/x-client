
import { type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner } "./EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner";

// EngagementMeasurementMetricsTotalInner.mo

module {
    // User-facing type: what application code uses
    public type EngagementMeasurementMetricsTotalInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        tweet_id : ?Text;
        value : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EngagementMeasurementMetricsTotalInner type
        public type JSON = {
            tweet_id : ?Text;
            value : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EngagementMeasurementMetricsTotalInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EngagementMeasurementMetricsTotalInner = ?json;
    }
}
