
// Variant.mo

module {
    // User-facing type: what application code uses
    public type Variant = {
        /// The bit rate of the media.
        bit_rate : ?Int;
        /// The content type of the media.
        content_type : ?Text;
        /// The url to the media.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Variant type
        public type JSON = {
            bit_rate : ?Int;
            content_type : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Variant) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Variant = ?json;
    }
}
