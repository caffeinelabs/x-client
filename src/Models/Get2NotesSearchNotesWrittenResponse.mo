
import { type Get2ChatConversationsIdResponseMeta; JSON = Get2ChatConversationsIdResponseMeta } "./Get2ChatConversationsIdResponseMeta";

import { type Note; JSON = Note } "./Note";

import { type Problem; JSON = Problem } "./Problem";

// Get2NotesSearchNotesWrittenResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2NotesSearchNotesWrittenResponse = {
        data : ?[Note];
        errors : ?[Problem];
        meta : ?Get2ChatConversationsIdResponseMeta;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2NotesSearchNotesWrittenResponse type
        public type JSON = {
            data : ?[Note];
            errors : ?[Problem];
            meta : ?Get2ChatConversationsIdResponseMeta;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2NotesSearchNotesWrittenResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2NotesSearchNotesWrittenResponse = ?json;
    }
}
