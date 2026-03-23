
// ContextAnnotationDomainFields.mo
/// Represents the data for the context annotation domain.

module {
    // User-facing type: what application code uses
    public type ContextAnnotationDomainFields = {
        /// Description of the context annotation domain.
        description : ?Text;
        /// The unique id for a context annotation domain.
        id : Text;
        /// Name of the context annotation domain.
        name : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ContextAnnotationDomainFields type
        public type JSON = {
            description : ?Text;
            id : Text;
            name : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ContextAnnotationDomainFields) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ContextAnnotationDomainFields = ?json;
    }
}
