
import { type UserComplianceSchemaUser; JSON = UserComplianceSchemaUser } "./UserComplianceSchemaUser";

// UserScrubGeoObjectSchema.mo

module {
    // User-facing type: what application code uses
    public type UserScrubGeoObjectSchema = {
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        up_to_tweet_id : Text;
        user : UserComplianceSchemaUser;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserScrubGeoObjectSchema type
        public type JSON = {
            event_at : Text;
            up_to_tweet_id : Text;
            user : UserComplianceSchemaUser;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserScrubGeoObjectSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserScrubGeoObjectSchema = ?json;
    }
}
