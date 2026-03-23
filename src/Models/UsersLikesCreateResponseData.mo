
// UsersLikesCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type UsersLikesCreateResponseData = {
        liked : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersLikesCreateResponseData type
        public type JSON = {
            liked : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersLikesCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersLikesCreateResponseData = ?json;
    }
}
