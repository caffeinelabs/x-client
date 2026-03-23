
import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";

// TweetEditComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetEditComplianceSchema = {
        tweet_edit : TweetEditComplianceObjectSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetEditComplianceSchema type
        public type JSON = {
            tweet_edit : TweetEditComplianceObjectSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetEditComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetEditComplianceSchema = ?json;
    }
}
