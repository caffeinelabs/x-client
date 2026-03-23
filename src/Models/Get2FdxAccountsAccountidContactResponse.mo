
import { type PlaidAccountContact; JSON = PlaidAccountContact } "./PlaidAccountContact";

import { type Problem; JSON = Problem } "./Problem";

// Get2FdxAccountsAccountidContactResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2FdxAccountsAccountidContactResponse = {
        data : ?PlaidAccountContact;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2FdxAccountsAccountidContactResponse type
        public type JSON = {
            data : ?PlaidAccountContact;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2FdxAccountsAccountidContactResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2FdxAccountsAccountidContactResponse = ?json;
    }
}
