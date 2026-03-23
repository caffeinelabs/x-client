
// EvaluateNoteResponseData.mo

module {
    // User-facing type: what application code uses
    public type EvaluateNoteResponseData = {
        /// Claim opinion model score for the note.
        claim_opinion_score : ?Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EvaluateNoteResponseData type
        public type JSON = {
            claim_opinion_score : ?Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EvaluateNoteResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EvaluateNoteResponseData = ?json;
    }
}
