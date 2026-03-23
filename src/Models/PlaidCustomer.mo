
// PlaidCustomer.mo
/// A user id for the plaid customer

module {
    // User-facing type: what application code uses
    public type PlaidCustomer = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        customerId : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidCustomer type
        public type JSON = {
            customerId : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidCustomer) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidCustomer = ?json;
    }
}
