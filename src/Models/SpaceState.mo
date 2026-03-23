
// SpaceState.mo
/// The current state of the Space.
/// Enum values: #live, #scheduled, #ended

module {
    // User-facing type: type-safe variants for application code
    public type SpaceState = {
        #live;
        #scheduled;
        #ended;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SpaceState type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SpaceState) : JSON =
            switch (value) {
                case (#live) "live";
                case (#scheduled) "scheduled";
                case (#ended) "ended";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SpaceState =
            switch (json) {
                case "live" ?#live;
                case "scheduled" ?#scheduled;
                case "ended" ?#ended;
                case _ null;
            };
    }
}
