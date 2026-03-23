
import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";

import { type TweetLabelStreamResponseOneOf; JSON = TweetLabelStreamResponseOneOf } "./TweetLabelStreamResponseOneOf";

// TweetLabelStreamResponse.mo
/// Tweet label stream events.
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type TweetLabelStreamResponse = {
        #TweetLabelStreamResponseOneOf : TweetLabelStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetLabelStreamResponse) : Text =
            switch (value) {
                case (#TweetLabelStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetLabelStreamResponse type
        public type JSON = {
            #TweetLabelStreamResponseOneOf : TweetLabelStreamResponseOneOf;
            #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetLabelStreamResponse) : JSON =
            switch (value) {
                case (#TweetLabelStreamResponseOneOf(v)) #TweetLabelStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) #LikesComplianceStreamResponseOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetLabelStreamResponse =
            switch (json) {
                case (#TweetLabelStreamResponseOneOf(v)) ?#TweetLabelStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) ?#LikesComplianceStreamResponseOneOf1(v);
            };
    }
}
