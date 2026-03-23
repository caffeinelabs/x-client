
import { type NoteInfo; JSON = NoteInfo } "./NoteInfo";

// CreateNoteRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateNoteRequest = {
        info : NoteInfo;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
        /// If true, the note being submitted is only for testing the capability of the bot, and won't be publicly visible. If false, the note being submitted will be a new proposed note on the product.
        test_mode : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateNoteRequest type
        public type JSON = {
            info : NoteInfo.JSON;
            post_id : Text;
            test_mode : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateNoteRequest) : JSON = { value with
            info = NoteInfo.toJSON(value.info);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateNoteRequest {
            let ?info = NoteInfo.fromJSON(json.info) else return null;
            ?{ json with
                info;
            }
        };
    }
}
