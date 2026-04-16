/// A response from deleting user-specified stream filtering rules.

import { type DeleteRulesRequestDelete; JSON = DeleteRulesRequestDelete } "./DeleteRulesRequestDelete";

// DeleteRulesRequest.mo

module {
    // User-facing type: what application code uses
    public type DeleteRulesRequest = {
        delete : DeleteRulesRequestDelete;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DeleteRulesRequest type
        public type JSON = {
            delete : DeleteRulesRequestDelete;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DeleteRulesRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DeleteRulesRequest = ?json;
    }
}
