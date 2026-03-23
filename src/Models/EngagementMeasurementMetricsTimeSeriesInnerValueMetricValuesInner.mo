
// EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner.mo

module {
    // User-facing type: what application code uses
    public type EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner = {
        metric_type : ?Text;
        metric_value : ?Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner type
        public type JSON = {
            metric_type : ?Text;
            metric_value : ?Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EngagementMeasurementMetricsTimeSeriesInnerValueMetricValuesInner = ?json;
    }
}
