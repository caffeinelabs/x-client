
// GetMediaAnalyticsGranularityParameter.mo
/// Enum values: #hourly, #daily, #total

module {
    // User-facing type: type-safe variants for application code
    public type GetMediaAnalyticsGranularityParameter = {
        #hourly;
        #daily;
        #total;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetMediaAnalyticsGranularityParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetMediaAnalyticsGranularityParameter) : JSON =
            switch (value) {
                case (#hourly) "hourly";
                case (#daily) "daily";
                case (#total) "total";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetMediaAnalyticsGranularityParameter =
            switch (json) {
                case "hourly" ?#hourly;
                case "daily" ?#daily;
                case "total" ?#total;
                case _ null;
            };
    }
}
