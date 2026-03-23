
// BookmarkFolderPostsResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type BookmarkFolderPostsResponseMeta = {
        /// The next token.
        next_token : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkFolderPostsResponseMeta type
        public type JSON = {
            next_token : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkFolderPostsResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkFolderPostsResponseMeta = ?json;
    }
}
