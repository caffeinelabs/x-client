/// The evaluation result of a community note.

// NoteTestResult.mo

module {
    // User-facing type: what application code uses
    public type NoteTestResult = {
        /// Score bucket from the evaluator result.
        evaluator_score_bucket : ?Text;
        /// The type of the evaluator.
        evaluator_type : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NoteTestResult type
        public type JSON = {
            evaluator_score_bucket : ?Text;
            evaluator_type : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NoteTestResult) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NoteTestResult = ?json;
    }
}
