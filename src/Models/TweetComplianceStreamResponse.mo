/// Tweet compliance stream events.

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type TweetComplianceData; JSON = TweetComplianceData } "./TweetComplianceData";

import { type TweetComplianceStreamResponseOneOf; JSON = TweetComplianceStreamResponseOneOf } "./TweetComplianceStreamResponseOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetComplianceStreamResponse.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type TweetComplianceStreamResponse = {
        #TweetComplianceStreamResponseOneOf : TweetComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetComplianceStreamResponse) : Text =
            switch (value) {
                case (#TweetComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : TweetComplianceStreamResponse) : Candid.Candid =
            switch (value) {
                case (#TweetComplianceStreamResponseOneOf(v)) #Variant(("TweetComplianceStreamResponseOneOf", TweetComplianceStreamResponseOneOf.toCandidValue(v)));
                case (#LikesComplianceStreamResponseOneOf1(v)) #Variant(("LikesComplianceStreamResponseOneOf1", LikesComplianceStreamResponseOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceStreamResponse =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("TweetComplianceStreamResponseOneOf") {
                            let ?inner = TweetComplianceStreamResponseOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetComplianceStreamResponseOneOf(inner)
                        };
                        case ("LikesComplianceStreamResponseOneOf1") {
                            let ?inner = LikesComplianceStreamResponseOneOf1.fromCandidValue(tagAndVal.1) else return null;
                            ?#LikesComplianceStreamResponseOneOf1(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
