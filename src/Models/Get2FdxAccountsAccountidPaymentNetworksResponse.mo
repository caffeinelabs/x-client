
import { type PlaidAccountPaymentNetwork; JSON = PlaidAccountPaymentNetwork } "./PlaidAccountPaymentNetwork";

import { type Problem; JSON = Problem } "./Problem";

// Get2FdxAccountsAccountidPaymentNetworksResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2FdxAccountsAccountidPaymentNetworksResponse = {
        data : ?[PlaidAccountPaymentNetwork];
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2FdxAccountsAccountidPaymentNetworksResponse type
        public type JSON = {
            data : ?[PlaidAccountPaymentNetwork];
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2FdxAccountsAccountidPaymentNetworksResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2FdxAccountsAccountidPaymentNetworksResponse = ?json;
    }
}
