
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";

// UserComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserComplianceSchema = {
        /// Event time.
        event_at : Text;
        user : UserComplianceSchemaUser;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserComplianceSchema type
        public type JSON = {
            event_at : Text;
            user : UserComplianceSchemaUser;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserComplianceSchema = ?json;
    }
}
