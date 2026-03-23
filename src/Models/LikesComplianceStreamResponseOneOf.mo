
import { type LikeComplianceSchema; JSON = LikeComplianceSchema } "./LikeComplianceSchema";

// LikesComplianceStreamResponseOneOf.mo
/// Compliance event.

module {
    // User-facing type: what application code uses
    public type LikesComplianceStreamResponseOneOf = {
        data : LikeComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer LikesComplianceStreamResponseOneOf type
        public type JSON = {
            data : LikeComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : LikesComplianceStreamResponseOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?LikesComplianceStreamResponseOneOf = ?json;
    }
}
