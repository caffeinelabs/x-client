
// GetConnectionHistoryStatusParameter.mo
/// Enum values: #active, #inactive, #all

module {
    // User-facing type: type-safe variants for application code
    public type GetConnectionHistoryStatusParameter = {
        #active;
        #inactive;
        #all;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetConnectionHistoryStatusParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetConnectionHistoryStatusParameter) : JSON =
            switch (value) {
                case (#active) "active";
                case (#inactive) "inactive";
                case (#all) "all";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetConnectionHistoryStatusParameter =
            switch (json) {
                case "active" ?#active;
                case "inactive" ?#inactive;
                case "all" ?#all;
                case _ null;
            };
    }
}
