
import { type TweetTakedownComplianceSchema; JSON = TweetTakedownComplianceSchema } "./TweetTakedownComplianceSchema";

// TweetWithheldComplianceSchema.mo

module {
    // User-facing type: what application code uses
    public type TweetWithheldComplianceSchema = {
        withheld : TweetTakedownComplianceSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetWithheldComplianceSchema type
        public type JSON = {
            withheld : TweetTakedownComplianceSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetWithheldComplianceSchema) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetWithheldComplianceSchema = ?json;
    }
}
