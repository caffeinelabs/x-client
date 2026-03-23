
// PlaidAccountPaymentNetwork.mo
/// Payment network details associated with the account.

module {
    // User-facing type: what application code uses
    public type PlaidAccountPaymentNetwork = {
        /// The bank ID associated with the account.
        bankId : Text;
        /// The payment network identifier.
        identifier : Text;
        /// Indicates if transfers into the account are supported.
        transferIn : Bool;
        /// Indicates if transfers out of the account are supported.
        transferOut : Bool;
        /// The type of payment network (e.g., ACH, SEPA).
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidAccountPaymentNetwork type
        public type JSON = {
            bankId : Text;
            identifier : Text;
            transferIn : Bool;
            transferOut : Bool;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidAccountPaymentNetwork) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidAccountPaymentNetwork = ?json;
    }
}
