
// PointType.mo
/// Enum values: #point

module {
    // User-facing type: type-safe variants for application code
    public type PointType = {
        #point;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PointType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PointType) : JSON =
            switch (value) {
                case (#point) "Point";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PointType =
            switch (json) {
                case "Point" ?#point;
                case _ null;
            };
    }
}
