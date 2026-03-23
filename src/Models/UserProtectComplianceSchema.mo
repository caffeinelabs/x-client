
import { type UserComplianceSchema; JSON = UserComplianceSchema } "./UserComplianceSchema";

// UserProtectComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserProtectComplianceSchema = {
        user_protect : UserComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserProtectComplianceSchema type
        public type JSON = {
            user_protect : UserComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserProtectComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserProtectComplianceSchema = ?json;
    }
}
