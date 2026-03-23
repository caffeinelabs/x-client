
// BookmarkFoldersResponseDataInner.mo

module {
    // User-facing type: what application code uses
    public type BookmarkFoldersResponseDataInner = {
        /// The unique identifier of this Bookmark folder.
        id : ?Text;
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkFoldersResponseDataInner type
        public type JSON = {
            id : ?Text;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkFoldersResponseDataInner) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkFoldersResponseDataInner = ?json;
    }
}
