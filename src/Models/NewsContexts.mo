
import { type NewsContextsEntities; JSON = NewsContextsEntities } "./NewsContextsEntities";

import { type NewsContextsFinance; JSON = NewsContextsFinance } "./NewsContextsFinance";

import { type NewsContextsSports; JSON = NewsContextsSports } "./NewsContextsSports";

// NewsContexts.mo

module {
    // User-facing type: what application code uses
    public type NewsContexts = {
        entities : ?NewsContextsEntities;
        finance : ?NewsContextsFinance;
        sports : ?NewsContextsSports;
        topics : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NewsContexts type
        public type JSON = {
            entities : ?NewsContextsEntities;
            finance : ?NewsContextsFinance;
            sports : ?NewsContextsSports;
            topics : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NewsContexts) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NewsContexts = ?json;
    }
}
