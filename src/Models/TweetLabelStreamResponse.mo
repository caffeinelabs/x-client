/// Tweet label stream events.

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type TweetLabelData; JSON = TweetLabelData } "./TweetLabelData";

import { type TweetLabelStreamResponseOneOf; JSON = TweetLabelStreamResponseOneOf } "./TweetLabelStreamResponseOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetLabelStreamResponse.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type TweetLabelStreamResponse = {
        #TweetLabelStreamResponseOneOf : TweetLabelStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetLabelStreamResponse) : Text =
            switch (value) {
                case (#TweetLabelStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : TweetLabelStreamResponse) : Candid.Candid =
            switch (value) {
                case (#TweetLabelStreamResponseOneOf(v)) #Variant(("TweetLabelStreamResponseOneOf", TweetLabelStreamResponseOneOf.toCandidValue(v)));
                case (#LikesComplianceStreamResponseOneOf1(v)) #Variant(("LikesComplianceStreamResponseOneOf1", LikesComplianceStreamResponseOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetLabelStreamResponse =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("TweetLabelStreamResponseOneOf") {
                            let ?inner = TweetLabelStreamResponseOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetLabelStreamResponseOneOf(inner)
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
