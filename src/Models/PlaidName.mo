/// Name information for the account holder.

// PlaidName.mo

module {
    // User-facing type: what application code uses
    public type PlaidName = {
        /// The first name of the account holder.
        first : Text;
        /// The last name of the account holder.
        last : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidName type
        public type JSON = {
            first : Text;
            last : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidName) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidName = ?json;
    }
}
