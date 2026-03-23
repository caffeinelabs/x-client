
import { type PlaidAccountTransaction; JSON = PlaidAccountTransaction } "./PlaidAccountTransaction";

import { type Problem; JSON = Problem } "./Problem";

// Get2FdxAccountsAccountidTransactionsResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2FdxAccountsAccountidTransactionsResponse = {
        data : ?[PlaidAccountTransaction];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2FdxAccountsAccountidTransactionsResponse type
        public type JSON = {
            data : ?[PlaidAccountTransaction];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2FdxAccountsAccountidTransactionsResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2FdxAccountsAccountidTransactionsResponse = ?json;
    }
}
