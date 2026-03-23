
import { type UserTakedownComplianceSchema; JSON = UserTakedownComplianceSchema } "./UserTakedownComplianceSchema";

// UserWithheldComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserWithheldComplianceSchema = {
        user_withheld : UserTakedownComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserWithheldComplianceSchema type
        public type JSON = {
            user_withheld : UserTakedownComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserWithheldComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserWithheldComplianceSchema = ?json;
    }
}
