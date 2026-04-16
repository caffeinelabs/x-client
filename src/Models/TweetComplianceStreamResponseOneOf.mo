/// Compliance event.

import { type TweetComplianceData; JSON = TweetComplianceData } "./TweetComplianceData";

// TweetComplianceStreamResponseOneOf.mo

module {
    // User-facing type: what application code uses
    public type TweetComplianceStreamResponseOneOf = {
        data : TweetComplianceData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetComplianceStreamResponseOneOf type
        public type JSON = {
            data : TweetComplianceData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetComplianceStreamResponseOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetComplianceStreamResponseOneOf = ?json;
    }
}
