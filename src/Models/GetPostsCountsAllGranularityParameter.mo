
// GetPostsCountsAllGranularityParameter.mo
/// Enum values: #minute, #hour, #day

module {
    // User-facing type: type-safe variants for application code
    public type GetPostsCountsAllGranularityParameter = {
        #minute;
        #hour;
        #day;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetPostsCountsAllGranularityParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetPostsCountsAllGranularityParameter) : JSON =
            switch (value) {
                case (#minute) "minute";
                case (#hour) "hour";
                case (#day) "day";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetPostsCountsAllGranularityParameter =
            switch (json) {
                case "minute" ?#minute;
                case "hour" ?#hour;
                case "day" ?#day;
                case _ null;
            };
    }
}
