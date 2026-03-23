
// NewsContextsEntities.mo

module {
    // User-facing type: what application code uses
    public type NewsContextsEntities = {
        events : ?[Text];
        organizations : ?[Text];
        people : ?[Text];
        places : ?[Text];
        products : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NewsContextsEntities type
        public type JSON = {
            events : ?[Text];
            organizations : ?[Text];
            people : ?[Text];
            places : ?[Text];
            products : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NewsContextsEntities) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NewsContextsEntities = ?json;
    }
}
