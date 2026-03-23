import { type Map } "mo:core/pure/Map";

// InvalidRequestProblemAllOfErrors.mo

module {
    // User-facing type: what application code uses
    public type InvalidRequestProblemAllOfErrors = {
        message : ?Text;
        parameters : ?Map<Text, [Text]>;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer InvalidRequestProblemAllOfErrors type
        public type JSON = {
            message : ?Text;
            parameters : ?Map<Text, [Text]>;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : InvalidRequestProblemAllOfErrors) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?InvalidRequestProblemAllOfErrors = ?json;
    }
}
