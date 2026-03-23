
// PlaceType.mo
/// Enum values: #poi, #neighborhood, #city, #admin, #country, #unknown

module {
    // User-facing type: type-safe variants for application code
    public type PlaceType = {
        #poi;
        #neighborhood;
        #city;
        #admin;
        #country;
        #unknown;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaceType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaceType) : JSON =
            switch (value) {
                case (#poi) "poi";
                case (#neighborhood) "neighborhood";
                case (#city) "city";
                case (#admin) "admin";
                case (#country) "country";
                case (#unknown) "unknown";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaceType =
            switch (json) {
                case "poi" ?#poi;
                case "neighborhood" ?#neighborhood;
                case "city" ?#city;
                case "admin" ?#admin;
                case "country" ?#country;
                case "unknown" ?#unknown;
                case _ null;
            };
    }
}
