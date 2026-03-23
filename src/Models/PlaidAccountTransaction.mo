
// PlaidAccountTransaction.mo
/// Descriptor for a Plaid account.

module {
    // User-facing type: what application code uses
    public type PlaidAccountTransaction = {
        /// The category of the account (e.g., personal, business).
        accountCategory : Text;
        /// The amount transacted.
        amount : Float;
        /// Memo for transaction (e.g. CREDIT)
        debitCreditMemo : Text;
        /// The transaction description
        description : Text;
        /// The timestamp when the transaction was posted.
        postedTimestamp : ?Text;
        /// The status of the transaction.
        status : Text;
        /// The identifier for the transaction.
        transactionId : Text;
        /// The timestamp when the transaction occurred.
        transactionTimestamp : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidAccountTransaction type
        public type JSON = {
            accountCategory : Text;
            amount : Float;
            debitCreditMemo : Text;
            description : Text;
            postedTimestamp : ?Text;
            status : Text;
            transactionId : Text;
            transactionTimestamp : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidAccountTransaction) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidAccountTransaction = ?json;
    }
}
