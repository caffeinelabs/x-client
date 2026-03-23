
// FoundMediaOrigin.mo

module {
    // User-facing type: what application code uses
    public type FoundMediaOrigin = {
        /// Unique Identifier of media within provider ( <= 24 characters ))
        id : Text;
        /// The media provider (e.g., 'giphy') that sourced the media ( <= 8 Characters )
        provider : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FoundMediaOrigin type
        public type JSON = {
            id : Text;
            provider : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FoundMediaOrigin) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FoundMediaOrigin = ?json;
    }
}
