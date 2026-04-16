/// Descriptor for a Plaid account.

import { type PlaidCurrency; JSON = PlaidCurrency } "./PlaidCurrency";

// PlaidAccount.mo

module {
    // User-facing type: what application code uses
    public type PlaidAccount = {
        /// The category of the account (e.g., personal, business).
        accountCategory : Text;
        /// The Plaid account ID.
        accountId : Text;
        /// The last 2-4 digits of the account number.
        accountNumberDisplay : Text;
        /// The type of the account (e.g., checking, savings).
        accountType : Text;
        /// The available balance of the account.
        availableBalance : ?Float;
        currency : PlaidCurrency;
        /// The current balance of the account.
        currentBalance : ?Float;
        /// The nickname of the account.
        nickname : ?Text;
        /// The name of the product associated with the account.
        productName : Text;
        /// The status of the account.
        status : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PlaidAccount type
        public type JSON = {
            accountCategory : Text;
            accountId : Text;
            accountNumberDisplay : Text;
            accountType : Text;
            availableBalance : ?Float;
            currency : PlaidCurrency;
            currentBalance : ?Float;
            nickname : ?Text;
            productName : Text;
            status : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PlaidAccount) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PlaidAccount = ?json;
    }
}
