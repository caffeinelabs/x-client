
import { type TweetHideResponseData; JSON = TweetHideResponseData } "./TweetHideResponseData";

// TweetHideResponse.mo

module {
    // User-facing type: what application code uses
    public type TweetHideResponse = {
        data : ?TweetHideResponseData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetHideResponse type
        public type JSON = {
            data : ?TweetHideResponseData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetHideResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetHideResponse = ?json;
    }
}
