
// CreateNoteResponseData.mo

module {
    // User-facing type: what application code uses
    public type CreateNoteResponseData = {
        /// The unique identifier of this Community Note.
        id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateNoteResponseData type
        public type JSON = {
            id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateNoteResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateNoteResponseData = ?json;
    }
}
