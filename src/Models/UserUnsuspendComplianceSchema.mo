
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserUnsuspendComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserUnsuspendComplianceSchema = {
        user_unsuspend : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserUnsuspendComplianceSchema type
        public type JSON = {
            user_unsuspend : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserUnsuspendComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserUnsuspendComplianceSchema = ?json;
    }
}
