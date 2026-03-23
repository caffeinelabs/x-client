
import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type TweetComplianceData; JSON = TweetComplianceData } "./TweetComplianceData";

import { type TweetComplianceStreamResponseOneOf; JSON = TweetComplianceStreamResponseOneOf } "./TweetComplianceStreamResponseOneOf";

// TweetComplianceStreamResponse.mo
/// Tweet compliance stream events.
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type TweetComplianceStreamResponse = {
        #TweetComplianceStreamResponseOneOf : TweetComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetComplianceStreamResponse) : Text =
            switch (value) {
                case (#TweetComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetComplianceStreamResponse type
        public type JSON = {
            #TweetComplianceStreamResponseOneOf : TweetComplianceStreamResponseOneOf;
            #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetComplianceStreamResponse) : JSON =
            switch (value) {
                case (#TweetComplianceStreamResponseOneOf(v)) #TweetComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) #LikesComplianceStreamResponseOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetComplianceStreamResponse =
            switch (json) {
                case (#TweetComplianceStreamResponseOneOf(v)) ?#TweetComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) ?#LikesComplianceStreamResponseOneOf1(v);
            };
    }
}
