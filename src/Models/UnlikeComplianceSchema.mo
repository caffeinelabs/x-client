
import { type UnlikeComplianceSchemaFavorite; JSON = UnlikeComplianceSchemaFavorite } "./UnlikeComplianceSchemaFavorite";

// UnlikeComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UnlikeComplianceSchema = {
        /// Event time.
        event_at : Text;
        favorite : UnlikeComplianceSchemaFavorite;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UnlikeComplianceSchema type
        public type JSON = {
            event_at : Text;
            favorite : UnlikeComplianceSchemaFavorite;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UnlikeComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UnlikeComplianceSchema = ?json;
    }
}
