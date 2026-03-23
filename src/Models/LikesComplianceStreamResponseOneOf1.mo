
import { type Problem; JSON = Problem } "./Problem";

// LikesComplianceStreamResponseOneOf1.mo

module {
    // User-facing type: what application code uses
    public type LikesComplianceStreamResponseOneOf1 = {
        errors : [Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer LikesComplianceStreamResponseOneOf1 type
        public type JSON = {
            errors : [Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : LikesComplianceStreamResponseOneOf1) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?LikesComplianceStreamResponseOneOf1 = ?json;
    }
}
