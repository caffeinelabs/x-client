
import { type RulesRequestSummaryOneOf; JSON = RulesRequestSummaryOneOf } "./RulesRequestSummaryOneOf";

import { type RulesRequestSummaryOneOf1; JSON = RulesRequestSummaryOneOf1 } "./RulesRequestSummaryOneOf1";

// RulesRequestSummary.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type RulesRequestSummary = {
        #RulesRequestSummaryOneOf : RulesRequestSummaryOneOf;
        #RulesRequestSummaryOneOf1 : RulesRequestSummaryOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : RulesRequestSummary) : Text =
            switch (value) {
                case (#RulesRequestSummaryOneOf(v)) Runtime.unreachable();
                case (#RulesRequestSummaryOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RulesRequestSummary type
        public type JSON = {
            #RulesRequestSummaryOneOf : RulesRequestSummaryOneOf;
            #RulesRequestSummaryOneOf1 : RulesRequestSummaryOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RulesRequestSummary) : JSON =
            switch (value) {
                case (#RulesRequestSummaryOneOf(v)) #RulesRequestSummaryOneOf(v);
                case (#RulesRequestSummaryOneOf1(v)) #RulesRequestSummaryOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RulesRequestSummary =
            switch (json) {
                case (#RulesRequestSummaryOneOf(v)) ?#RulesRequestSummaryOneOf(v);
                case (#RulesRequestSummaryOneOf1(v)) ?#RulesRequestSummaryOneOf1(v);
            };
    }
}
