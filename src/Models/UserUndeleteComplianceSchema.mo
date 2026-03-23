
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserUndeleteComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserUndeleteComplianceSchema = {
        user_undelete : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserUndeleteComplianceSchema type
        public type JSON = {
            user_undelete : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserUndeleteComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserUndeleteComplianceSchema = ?json;
    }
}
