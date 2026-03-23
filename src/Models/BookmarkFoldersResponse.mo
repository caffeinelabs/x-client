
import { type BookmarkFolderPostsResponseMeta; JSON = BookmarkFolderPostsResponseMeta } "./BookmarkFolderPostsResponseMeta";

import { type BookmarkFoldersResponseDataInner; JSON = BookmarkFoldersResponseDataInner } "./BookmarkFoldersResponseDataInner";

import { type Problem; JSON = Problem } "./Problem";

// BookmarkFoldersResponse.mo

module {
    // User-facing type: what application code uses
    public type BookmarkFoldersResponse = {
        data : ?[BookmarkFoldersResponseDataInner];
        errors : ?[Problem];
        meta : ?BookmarkFolderPostsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BookmarkFoldersResponse type
        public type JSON = {
            data : ?[BookmarkFoldersResponseDataInner];
            errors : ?[Problem];
            meta : ?BookmarkFolderPostsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BookmarkFoldersResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BookmarkFoldersResponse = ?json;
    }
}
