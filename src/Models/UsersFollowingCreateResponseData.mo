
// UsersFollowingCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type UsersFollowingCreateResponseData = {
        following : ?Bool;
        pending_follow : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersFollowingCreateResponseData type
        public type JSON = {
            following : ?Bool;
            pending_follow : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersFollowingCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersFollowingCreateResponseData = ?json;
    }
}
