
import { type BookmarkFolderPostsResponseMeta; JSON = BookmarkFolderPostsResponseMeta } "./BookmarkFolderPostsResponseMeta";

import { type Community; JSON = Community } "./Community";

import { type Problem; JSON = Problem } "./Problem";

// Get2CommunitiesSearchResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2CommunitiesSearchResponse = {
        data : ?[Community];
        errors : ?[Problem];
        meta : ?BookmarkFolderPostsResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2CommunitiesSearchResponse type
        public type JSON = {
            data : ?[Community];
            errors : ?[Problem];
            meta : ?BookmarkFolderPostsResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2CommunitiesSearchResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2CommunitiesSearchResponse = ?json;
    }
}
