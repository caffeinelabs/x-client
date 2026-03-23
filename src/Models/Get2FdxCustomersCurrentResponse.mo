
import { type PlaidCustomer; JSON = PlaidCustomer } "./PlaidCustomer";

import { type Problem; JSON = Problem } "./Problem";

// Get2FdxCustomersCurrentResponse.mo

module {
    // User-facing type: what application code uses
    public type Get2FdxCustomersCurrentResponse = {
        data : ?PlaidCustomer;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Get2FdxCustomersCurrentResponse type
        public type JSON = {
            data : ?PlaidCustomer;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Get2FdxCustomersCurrentResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Get2FdxCustomersCurrentResponse = ?json;
    }
}
