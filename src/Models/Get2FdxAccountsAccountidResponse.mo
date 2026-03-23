
import { type PlaidAccount; JSON = PlaidAccount } "./PlaidAccount";

import { type Problem; JSON = Problem } "./Problem";

// Get2FdxAccountsAccountidResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2FdxAccountsAccountidResponse = {
        data : ?PlaidAccount;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2FdxAccountsAccountidResponse type
        public type JSON = {
            data : ?PlaidAccount;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2FdxAccountsAccountidResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2FdxAccountsAccountidResponse = ?json;
    }
}
