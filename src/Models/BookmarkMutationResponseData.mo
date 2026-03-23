
// BookmarkMutationResponseData.mo

module {
    // User-facing type: what application code uses
    public type BookmarkMutationResponseData = {
        bookmarked : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkMutationResponseData type
        public type JSON = {
            bookmarked : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkMutationResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkMutationResponseData = ?json;
    }
}
