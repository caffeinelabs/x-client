
// GetPostsAnalyticsGranularityParameter.mo
/// Enum values: #hourly, #daily, #weekly, #total

module {
    // User-facing type: type-safe variants for application code
    public type GetPostsAnalyticsGranularityParameter = {
        #hourly;
        #daily;
        #weekly;
        #total;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetPostsAnalyticsGranularityParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetPostsAnalyticsGranularityParameter) : JSON =
            switch (value) {
                case (#hourly) "hourly";
                case (#daily) "daily";
                case (#weekly) "weekly";
                case (#total) "total";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetPostsAnalyticsGranularityParameter =
            switch (json) {
                case "hourly" ?#hourly;
                case "daily" ?#daily;
                case "weekly" ?#weekly;
                case "total" ?#total;
                case _ null;
            };
    }
}
