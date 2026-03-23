
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserUnprotectComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserUnprotectComplianceSchema = {
        user_unprotect : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserUnprotectComplianceSchema type
        public type JSON = {
            user_unprotect : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserUnprotectComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserUnprotectComplianceSchema = ?json;
    }
}
