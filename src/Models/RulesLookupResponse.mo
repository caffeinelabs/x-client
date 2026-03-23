
import { type Rule; JSON = Rule } "./Rule";

import { type RulesResponseMetadata; JSON = RulesResponseMetadata } "./RulesResponseMetadata";

// RulesLookupResponse.mo

module {
    // User-facing type: what application code uses
    public type RulesLookupResponse = {
        data : ?[Rule];
        meta : RulesResponseMetadata;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesLookupResponse type
        public type JSON = {
            data : ?[Rule];
            meta : RulesResponseMetadata;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesLookupResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesLookupResponse = ?json;
    }
}
