
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserSuspendComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserSuspendComplianceSchema = {
        user_suspend : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserSuspendComplianceSchema type
        public type JSON = {
            user_suspend : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserSuspendComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserSuspendComplianceSchema = ?json;
    }
}
