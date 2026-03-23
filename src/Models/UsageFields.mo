
// UsageFields.mo
/// Represents the data for Usage

module {
    // User-facing type: what application code uses
    public type UsageFields = {
        /// The time period for the usage
        date : ?Text;
        /// The usage value
        usage : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageFields type
        public type JSON = {
            date : ?Text;
            usage : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageFields) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageFields = ?json;
    }
}
