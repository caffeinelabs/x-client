/// Tweet Label event.

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";

// TweetLabelStreamResponseOneOf.mo

module {
    // User-facing type: what application code uses
    public type TweetLabelStreamResponseOneOf = {
        data : TweetLabelData;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetLabelStreamResponseOneOf type
        public type JSON = {
            data : TweetLabelData;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetLabelStreamResponseOneOf) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetLabelStreamResponseOneOf = ?json;
    }
}
