
// ListFollowedRequest.mo

module {
    // User-facing type: what application code uses
    public type ListFollowedRequest = {
        /// The unique identifier of this List.
        list_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListFollowedRequest type
        public type JSON = {
            list_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListFollowedRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListFollowedRequest = ?json;
    }
}
