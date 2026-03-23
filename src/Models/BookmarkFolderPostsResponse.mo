
import { type BookmarkFolderPostsResponseDataInner; JSON = BookmarkFolderPostsResponseDataInner } "./BookmarkFolderPostsResponseDataInner";

import { type BookmarkFolderPostsResponseMeta; JSON = BookmarkFolderPostsResponseMeta } "./BookmarkFolderPostsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";

// BookmarkFolderPostsResponse.mo

module {
    // User-facing type: what application code uses
    public type BookmarkFolderPostsResponse = {
        data : ?[BookmarkFolderPostsResponseDataInner];
        errors : ?[Problem];
        meta : ?BookmarkFolderPostsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkFolderPostsResponse type
        public type JSON = {
            data : ?[BookmarkFolderPostsResponseDataInner];
            errors : ?[Problem];
            meta : ?BookmarkFolderPostsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkFolderPostsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkFolderPostsResponse = ?json;
    }
}
