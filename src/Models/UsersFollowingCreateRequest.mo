
// UsersFollowingCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type UsersFollowingCreateRequest = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        target_user_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsersFollowingCreateRequest type
        public type JSON = {
            target_user_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsersFollowingCreateRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsersFollowingCreateRequest = ?json;
    }
}
