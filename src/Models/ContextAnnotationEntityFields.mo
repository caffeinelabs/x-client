
// ContextAnnotationEntityFields.mo
/// Represents the data for the context annotation entity.

module {
    // User-facing type: what application code uses
    public type ContextAnnotationEntityFields = {
        /// Description of the context annotation entity.
        description : ?Text;
        /// The unique id for a context annotation entity.
        id : Text;
        /// Name of the context annotation entity.
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ContextAnnotationEntityFields type
        public type JSON = {
            description : ?Text;
            id : Text;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ContextAnnotationEntityFields) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ContextAnnotationEntityFields = ?json;
    }
}
