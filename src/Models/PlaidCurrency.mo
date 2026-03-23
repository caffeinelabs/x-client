
// PlaidCurrency.mo
/// Currency information.

module {
    // User-facing type: what application code uses
    public type PlaidCurrency = {
        /// The ISO 4217 currency code.
        currencyCode : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidCurrency type
        public type JSON = {
            currencyCode : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidCurrency) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidCurrency = ?json;
    }
}
