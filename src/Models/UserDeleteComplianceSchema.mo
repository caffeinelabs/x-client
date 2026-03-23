
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserDeleteComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserDeleteComplianceSchema = {
        user_delete : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserDeleteComplianceSchema type
        public type JSON = {
            user_delete : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserDeleteComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserDeleteComplianceSchema = ?json;
    }
}
