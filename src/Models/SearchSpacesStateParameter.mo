
// SearchSpacesStateParameter.mo
/// Enum values: #live, #scheduled, #all

module {
    // User-facing type: type-safe variants for application code
    public type SearchSpacesStateParameter = {
        #live;
        #scheduled;
        #all;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchSpacesStateParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchSpacesStateParameter) : JSON =
            switch (value) {
                case (#live) "live";
                case (#scheduled) "scheduled";
                case (#all) "all";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchSpacesStateParameter =
            switch (json) {
                case "live" ?#live;
                case "scheduled" ?#scheduled;
                case "all" ?#all;
                case _ null;
            };
    }
}
