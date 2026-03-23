
// GetInsights28HrGranularityParameter.mo
/// Enum values: #daily, #hourly, #weekly, #total

module {
    // User-facing type: type-safe variants for application code
    public type GetInsights28HrGranularityParameter = {
        #daily;
        #hourly;
        #weekly;
        #total;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetInsights28HrGranularityParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetInsights28HrGranularityParameter) : JSON =
            switch (value) {
                case (#daily) "Daily";
                case (#hourly) "Hourly";
                case (#weekly) "Weekly";
                case (#total) "Total";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetInsights28HrGranularityParameter =
            switch (json) {
                case "Daily" ?#daily;
                case "Hourly" ?#hourly;
                case "Weekly" ?#weekly;
                case "Total" ?#total;
                case _ null;
            };
    }
}
