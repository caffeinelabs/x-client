
import { type NoteInfo; JSON = NoteInfo } "./NoteInfo";

import { type NoteRatingStatus; JSON = NoteRatingStatus } "./NoteRatingStatus";

import { type NoteTestResult; JSON = NoteTestResult } "./NoteTestResult";

// Note.mo
/// A X Community Note is a note on a Post.

module {
    // User-facing type: what application code uses
    public type Note = {
        /// The unique identifier of this Community Note.
        id : Text;
        info : ?NoteInfo;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
        status : ?NoteRatingStatus;
        test_result : ?NoteTestResult;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Note type
        public type JSON = {
            id : Text;
            info : ?NoteInfo.JSON;
            post_id : Text;
            status : ?NoteRatingStatus.JSON;
            test_result : ?NoteTestResult;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Note) : JSON = { value with
            info = do ? { NoteInfo.toJSON(value.info!) };
            status = do ? { NoteRatingStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Note {
            ?{ json with
                info = do ? { NoteInfo.fromJSON(json.info!)! };
                status = do ? { NoteRatingStatus.fromJSON(json.status!)! };
            }
        };
    }
}
