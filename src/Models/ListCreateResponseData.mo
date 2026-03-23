
// ListCreateResponseData.mo
/// A X List is a curated group of accounts.

module {
    // User-facing type: what application code uses
    public type ListCreateResponseData = {
        /// The unique identifier of this List.
        id : Text;
        /// The name of this List.
        name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListCreateResponseData type
        public type JSON = {
            id : Text;
            name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListCreateResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListCreateResponseData = ?json;
    }
}
