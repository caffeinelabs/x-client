/// A response from modifying user-specified stream filtering rules.

import { type Problem; JSON = Problem } "./Problem";

import { type Rule; JSON = Rule } "./Rule";

import { type RulesResponseMetadata; JSON = RulesResponseMetadata } "./RulesResponseMetadata";

// AddOrDeleteRulesResponse.mo

module {
    // User-facing type: what application code uses
    public type AddOrDeleteRulesResponse = {
        /// All user-specified stream filtering rules that were created.
        data : ?[Rule];
        errors : ?[Problem];
        meta : RulesResponseMetadata;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AddOrDeleteRulesResponse type
        public type JSON = {
            data : ?[Rule];
            errors : ?[Problem];
            meta : RulesResponseMetadata;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AddOrDeleteRulesResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AddOrDeleteRulesResponse = ?json;
    }
}
