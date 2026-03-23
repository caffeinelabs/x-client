
// EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp.mo

module {
    // User-facing type: what application code uses
    public type EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp = {
        iso8601_time : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp type
        public type JSON = {
            iso8601_time : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EngagementMeasurementMetricsTimeSeriesInnerValueTimestamp = ?json;
    }
}
