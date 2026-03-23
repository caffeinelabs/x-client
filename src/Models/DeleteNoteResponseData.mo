
// DeleteNoteResponseData.mo

module {
    // User-facing type: what application code uses
    public type DeleteNoteResponseData = {
        deleted : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteNoteResponseData type
        public type JSON = {
            deleted : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteNoteResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteNoteResponseData = ?json;
    }
}
