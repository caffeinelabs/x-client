/// Likes compliance stream events.

import { type LikeComplianceSchema; JSON = LikeComplianceSchema } "./LikeComplianceSchema";

import { type LikesComplianceStreamResponseOneOf; JSON = LikesComplianceStreamResponseOneOf } "./LikesComplianceStreamResponseOneOf";

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

// LikesComplianceStreamResponse.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type LikesComplianceStreamResponse = {
        #LikesComplianceStreamResponseOneOf : LikesComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : LikesComplianceStreamResponse) : Text =
            switch (value) {
                case (#LikesComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer LikesComplianceStreamResponse type
        public type JSON = {
            #LikesComplianceStreamResponseOneOf : LikesComplianceStreamResponseOneOf;
            #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : LikesComplianceStreamResponse) : JSON =
            switch (value) {
                case (#LikesComplianceStreamResponseOneOf(v)) #LikesComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) #LikesComplianceStreamResponseOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?LikesComplianceStreamResponse =
            switch (json) {
                case (#LikesComplianceStreamResponseOneOf(v)) ?#LikesComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) ?#LikesComplianceStreamResponseOneOf1(v);
            };
    }
}
