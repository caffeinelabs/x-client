
// GetListsByIdExpansionsParameterInner.mo
/// Enum values: #owner_id

module {
    // User-facing type: type-safe variants for application code
    public type GetListsByIdExpansionsParameterInner = {
        #owner_id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetListsByIdExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetListsByIdExpansionsParameterInner) : JSON =
            switch (value) {
                case (#owner_id) "owner_id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetListsByIdExpansionsParameterInner =
            switch (json) {
                case "owner_id" ?#owner_id;
                case _ null;
            };
    }
}
