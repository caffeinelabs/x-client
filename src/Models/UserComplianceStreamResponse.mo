/// User compliance stream events.

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type UserComplianceData; JSON = UserComplianceData } "./UserComplianceData";

import { type UserComplianceStreamResponseOneOf; JSON = UserComplianceStreamResponseOneOf } "./UserComplianceStreamResponseOneOf";

// UserComplianceStreamResponse.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type UserComplianceStreamResponse = {
        #UserComplianceStreamResponseOneOf : UserComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : UserComplianceStreamResponse) : Text =
            switch (value) {
                case (#UserComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserComplianceStreamResponse type
        public type JSON = {
            #UserComplianceStreamResponseOneOf : UserComplianceStreamResponseOneOf;
            #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserComplianceStreamResponse) : JSON =
            switch (value) {
                case (#UserComplianceStreamResponseOneOf(v)) #UserComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) #LikesComplianceStreamResponseOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserComplianceStreamResponse =
            switch (json) {
                case (#UserComplianceStreamResponseOneOf(v)) ?#UserComplianceStreamResponseOneOf(v);
                case (#LikesComplianceStreamResponseOneOf1(v)) ?#LikesComplianceStreamResponseOneOf1(v);
            };
    }
}
