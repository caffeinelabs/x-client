
import { type UnlikeComplianceSchema; JSON = UnlikeComplianceSchema } "./UnlikeComplianceSchema";

// LikeComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type LikeComplianceSchema = {
        delete : UnlikeComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer LikeComplianceSchema type
        public type JSON = {
            delete : UnlikeComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : LikeComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?LikeComplianceSchema = ?json;
    }
}
