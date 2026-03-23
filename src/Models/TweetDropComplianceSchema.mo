
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";

// TweetDropComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetDropComplianceSchema = {
        drop : TweetComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetDropComplianceSchema type
        public type JSON = {
            drop : TweetComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetDropComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetDropComplianceSchema = ?json;
    }
}
