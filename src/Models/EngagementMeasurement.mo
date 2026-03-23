
import { type EngagementMeasurementMetricsTimeSeriesInner; JSON = EngagementMeasurementMetricsTimeSeriesInner } "./EngagementMeasurementMetricsTimeSeriesInner";

import { type EngagementMeasurementMetricsTotalInner; JSON = EngagementMeasurementMetricsTotalInner } "./EngagementMeasurementMetricsTotalInner";

// EngagementMeasurement.mo

module {
    // User-facing type: what application code uses
    public type EngagementMeasurement = {
        metrics_time_series : ?[EngagementMeasurementMetricsTimeSeriesInner];
        metrics_total : ?[EngagementMeasurementMetricsTotalInner];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EngagementMeasurement type
        public type JSON = {
            metrics_time_series : ?[EngagementMeasurementMetricsTimeSeriesInner];
            metrics_total : ?[EngagementMeasurementMetricsTotalInner];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EngagementMeasurement) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EngagementMeasurement = ?json;
    }
}
