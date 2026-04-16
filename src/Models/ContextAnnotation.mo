/// Annotation inferred from the Tweet text.

import { type ContextAnnotationDomainFields; JSON = ContextAnnotationDomainFields } "./ContextAnnotationDomainFields";

import { type ContextAnnotationEntityFields; JSON = ContextAnnotationEntityFields } "./ContextAnnotationEntityFields";

// ContextAnnotation.mo

module {
    // User-facing type: what application code uses
    public type ContextAnnotation = {
        domain : ContextAnnotationDomainFields;
        entity : ContextAnnotationEntityFields;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ContextAnnotation type
        public type JSON = {
            domain : ContextAnnotationDomainFields;
            entity : ContextAnnotationEntityFields;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ContextAnnotation) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ContextAnnotation = ?json;
    }
}
