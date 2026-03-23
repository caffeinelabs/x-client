
import { type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner } "./EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner";

import { type EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp; JSON = EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp } "./EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp";

// EngagementMeasurementMetricsTimeSeriesInnerValue.mo

module {
    // User-facing type: what application code uses
    public type EngagementMeasurementMetricsTimeSeriesInnerValue = {
        metric_values : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
        timestamp : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EngagementMeasurementMetricsTimeSeriesInnerValue type
        public type JSON = {
            metric_values : ?[EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner];
            timestamp : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EngagementMeasurementMetricsTimeSeriesInnerValue) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EngagementMeasurementMetricsTimeSeriesInnerValue = ?json;
    }
}
