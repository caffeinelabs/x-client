
// UsageCapExceededProblemAllOfPeriod.mo
/// Enum values: #daily, #monthly

module {
    // User-facing type: type-safe variants for application code
    public type UsageCapExceededProblemAllOfPeriod = {
        #daily;
        #monthly;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageCapExceededProblemAllOfPeriod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageCapExceededProblemAllOfPeriod) : JSON =
            switch (value) {
                case (#daily) "Daily";
                case (#monthly) "Monthly";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageCapExceededProblemAllOfPeriod =
            switch (json) {
                case "Daily" ?#daily;
                case "Monthly" ?#monthly;
                case _ null;
            };
    }
}
