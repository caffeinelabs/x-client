/// User compliance stream events.

import { type LikesComplianceStreamResponseOneOf1; JSON = LikesComplianceStreamResponseOneOf1 } "./LikesComplianceStreamResponseOneOf1";

import { type Problem; JSON = Problem } "./Problem";

import { type UserComplianceData; JSON = UserComplianceData } "./UserComplianceData";

import { type UserComplianceStreamResponseOneOf; JSON = UserComplianceStreamResponseOneOf } "./UserComplianceStreamResponseOneOf";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserComplianceStreamResponse.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type UserComplianceStreamResponse = {
        #UserComplianceStreamResponseOneOf : UserComplianceStreamResponseOneOf;
        #LikesComplianceStreamResponseOneOf1 : LikesComplianceStreamResponseOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : UserComplianceStreamResponse) : Text =
            switch (value) {
                case (#UserComplianceStreamResponseOneOf(v)) Runtime.unreachable();
                case (#LikesComplianceStreamResponseOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : UserComplianceStreamResponse) : Candid.Candid =
            switch (value) {
                case (#UserComplianceStreamResponseOneOf(v)) #Variant(("UserComplianceStreamResponseOneOf", UserComplianceStreamResponseOneOf.toCandidValue(v)));
                case (#LikesComplianceStreamResponseOneOf1(v)) #Variant(("LikesComplianceStreamResponseOneOf1", LikesComplianceStreamResponseOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserComplianceStreamResponse =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("UserComplianceStreamResponseOneOf") {
                            let ?inner = UserComplianceStreamResponseOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#UserComplianceStreamResponseOneOf(inner)
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
