/// A request to add a user-specified stream filtering rule.

import { type RuleNoId; JSON = RuleNoId } "./RuleNoId";

// AddRulesRequest.mo

module {
    // User-facing type: what application code uses
    public type AddRulesRequest = {
        add : [RuleNoId];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AddRulesRequest type
        public type JSON = {
            add : [RuleNoId];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AddRulesRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AddRulesRequest = ?json;
    }
}
