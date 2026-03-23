
// SensitiveMediaWarning.mo

module {
    // User-facing type: what application code uses
    public type SensitiveMediaWarning = {
        /// Indicates if the content contains adult material
        adult_content : ?Bool;
        /// Indicates if the content depicts graphic violence
        graphic_violence : ?Bool;
        /// Indicates if the content has other sensitive characteristics
        other : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SensitiveMediaWarning type
        public type JSON = {
            adult_content : ?Bool;
            graphic_violence : ?Bool;
            other : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SensitiveMediaWarning) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SensitiveMediaWarning = ?json;
    }
}
