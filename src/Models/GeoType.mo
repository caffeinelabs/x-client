
// GeoType.mo
/// Enum values: #feature

module {
    // User-facing type: type-safe variants for application code
    public type GeoType = {
        #feature;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GeoType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GeoType) : JSON =
            switch (value) {
                case (#feature) "Feature";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GeoType =
            switch (json) {
                case "Feature" ?#feature;
                case _ null;
            };
    }
}
