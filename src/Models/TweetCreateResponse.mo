
import { type Problem; JSON = Problem } "./Problem";

import { type TweetCreateResponseData; JSON = TweetCreateResponseData } "./TweetCreateResponseData";

// TweetCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type TweetCreateResponse = {
        data : ?TweetCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateResponse type
        public type JSON = {
            data : ?TweetCreateResponseData;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateResponse = ?json;
    }
}
