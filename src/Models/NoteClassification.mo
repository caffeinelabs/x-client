
// NoteClassification.mo
/// Community Note classification type.
/// Enum values: #misinformed_or_potentially_misleading, #not_misleading

module {
    // User-facing type: type-safe variants for application code
    public type NoteClassification = {
        #misinformed_or_potentially_misleading;
        #not_misleading;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NoteClassification type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NoteClassification) : JSON =
            switch (value) {
                case (#misinformed_or_potentially_misleading) "misinformed_or_potentially_misleading";
                case (#not_misleading) "not_misleading";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NoteClassification =
            switch (json) {
                case "misinformed_or_potentially_misleading" ?#misinformed_or_potentially_misleading;
                case "not_misleading" ?#not_misleading;
                case _ null;
            };
    }
}
