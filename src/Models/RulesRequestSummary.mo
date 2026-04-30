
import { type RulesRequestSummaryOneOf; JSON = RulesRequestSummaryOneOf } "./RulesRequestSummaryOneOf";

import { type RulesRequestSummaryOneOf1; JSON = RulesRequestSummaryOneOf1 } "./RulesRequestSummaryOneOf1";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesRequestSummary.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type RulesRequestSummary = {
        #RulesRequestSummaryOneOf : RulesRequestSummaryOneOf;
        #RulesRequestSummaryOneOf1 : RulesRequestSummaryOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : RulesRequestSummary) : Text =
            switch (value) {
                case (#RulesRequestSummaryOneOf(v)) Runtime.unreachable();
                case (#RulesRequestSummaryOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : RulesRequestSummary) : Candid.Candid =
            switch (value) {
                case (#RulesRequestSummaryOneOf(v)) #Variant(("RulesRequestSummaryOneOf", RulesRequestSummaryOneOf.toCandidValue(v)));
                case (#RulesRequestSummaryOneOf1(v)) #Variant(("RulesRequestSummaryOneOf1", RulesRequestSummaryOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesRequestSummary =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("RulesRequestSummaryOneOf") {
                            let ?inner = RulesRequestSummaryOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#RulesRequestSummaryOneOf(inner)
                        };
                        case ("RulesRequestSummaryOneOf1") {
                            let ?inner = RulesRequestSummaryOneOf1.fromCandidValue(tagAndVal.1) else return null;
                            ?#RulesRequestSummaryOneOf1(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
