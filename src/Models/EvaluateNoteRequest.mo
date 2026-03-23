
// EvaluateNoteRequest.mo

module {
    // User-facing type: what application code uses
    public type EvaluateNoteRequest = {
        /// Text for the community note.
        note_text : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        post_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EvaluateNoteRequest type
        public type JSON = {
            note_text : Text;
            post_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EvaluateNoteRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EvaluateNoteRequest = ?json;
    }
}
