
import { type UserProfileModificationObjectSchema; JSON = UserProfileModificationObjectSchema } "./UserProfileModificationObjectSchema";

// UserProfileModificationComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type UserProfileModificationComplianceSchema = {
        user_profile_modification : UserProfileModificationObjectSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserProfileModificationComplianceSchema type
        public type JSON = {
            user_profile_modification : UserProfileModificationObjectSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserProfileModificationComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserProfileModificationComplianceSchema = ?json;
    }
}
