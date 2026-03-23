
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";

// UserTakedownComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserTakedownComplianceSchema = {
        /// Event time.
        event_at : Text;
        user : UserComplianceSchemaUser;
        withheld_in_countries : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserTakedownComplianceSchema type
        public type JSON = {
            event_at : Text;
            user : UserComplianceSchemaUser;
            withheld_in_countries : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserTakedownComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserTakedownComplianceSchema = ?json;
    }
}
