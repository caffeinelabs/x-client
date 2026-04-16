/// Annotation for entities based on the Tweet text.

import Int "mo:core/Int";

// FullTextEntitiesAnnotationsInner.mo

module {
    // User-facing type: what application code uses
    public type FullTextEntitiesAnnotationsInner = {
        /// Index (zero-based) at which position this entity ends.  The index is inclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// Text used to determine annotation.
        normalized_text : ?Text;
        /// Confidence factor for annotation type.
        probability : ?Float;
        /// Annotation type.
        type_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FullTextEntitiesAnnotationsInner type
        public type JSON = {
            end : Int;
            start : Int;
            normalized_text : ?Text;
            probability : ?Float;
            type_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FullTextEntitiesAnnotationsInner) : JSON = {
            end = value.end;
            start = value.start;
            normalized_text = value.normalized_text;
            probability = value.probability;
            type_ = value.type_;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FullTextEntitiesAnnotationsInner {
            ?{
                end = if (json.end < 0) return null else Int.abs(json.end);
                start = if (json.start < 0) return null else Int.abs(json.start);
                normalized_text = json.normalized_text;
                probability = json.probability;
                type_ = json.type_;
            }
        };
    }
}
