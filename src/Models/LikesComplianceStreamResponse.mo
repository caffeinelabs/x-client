/// Likes compliance stream events.

import { type LikeComplianceSchema; JSON = LikeComplianceSchema } "./LikeComplianceSchema";

import { type LikesComplianceStreamResponseOneOf; JSON = LikesComplianceStreamResponseOneOf } "./LikesComplianceStreamResponseOneOf";

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// LikesComplianceStreamResponse.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type LikesComplianceStreamResponse = {
        #LikesComplianceStreamResponseOneOf : LikesComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : LikesComplianceStreamResponse) : Text =
            switch (value) {
                case (#LikesComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : LikesComplianceStreamResponse) : Candid.Candid =
            switch (value) {
                case (#LikesComplianceStreamResponseOneOf(v)) #Variant(("LikesComplianceStreamResponseOneOf", LikesComplianceStreamResponseOneOf.toCandidValue(v)));
                case (#LikesComplianceStreamResponseOneOf1(v)) #Variant(("LikesComplianceStreamResponseOneOf1", LikesComplianceStreamResponseOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?LikesComplianceStreamResponse =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("LikesComplianceStreamResponseOneOf") {
                            let ?inner = LikesComplianceStreamResponseOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#LikesComplianceStreamResponseOneOf(inner)
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
