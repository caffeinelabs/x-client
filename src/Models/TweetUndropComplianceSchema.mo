
import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";

// TweetUndropComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetUndropComplianceSchema = {
        undrop : TweetComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetUndropComplianceSchema type
        public type JSON = {
            undrop : TweetComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetUndropComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetUndropComplianceSchema = ?json;
    }
}
