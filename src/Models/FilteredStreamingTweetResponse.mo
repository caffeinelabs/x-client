/// A Tweet or error that can be returned by the streaming Tweet API. The values returned with a successful streamed Tweet includes the user provided rules that the Tweet matched.

import { type Expansions; JSON = Expansions } "./Expansions";

import { type FilteredStreamingTweetResponseMatchingRulesInner; JSON = FilteredStreamingTweetResponseMatchingRulesInner } "./FilteredStreamingTweetResponseMatchingRulesInner";

import { type Problem; JSON = Problem } "./Problem";

import { type Tweet; JSON = Tweet } "./Tweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// FilteredStreamingTweetResponse.mo

module {
    public type FilteredStreamingTweetResponse = {
        data : ?Tweet;
        errors : ?[Problem];
        includes : ?Expansions;
        /// The list of rules which matched the Tweet
        matching_rules : ?[FilteredStreamingTweetResponseMatchingRulesInner];
    };

    public module JSON {
        // `init` constructs a FilteredStreamingTweetResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { FilteredStreamingTweetResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : FilteredStreamingTweetResponse {
            let ?res = from_candid(to_candid(required)) : ?FilteredStreamingTweetResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : FilteredStreamingTweetResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", Tweet.toCandidValue(v__)));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.includes) {
                case (?v__) List.add(buf, ("includes", Expansions.toCandidValue(v__)));
                case null ();
            };
            switch (value.matching_rules) {
                case (?v__) List.add(buf, ("matching_rules", #Array(Array.map<FilteredStreamingTweetResponseMatchingRulesInner, Candid.Candid>(v__, FilteredStreamingTweetResponseMatchingRulesInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FilteredStreamingTweetResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?Tweet = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (Tweet.fromCandidValue(data_field.1));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let includes : ?Expansions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "includes")) {
                        case (?includes_field) (Expansions.fromCandidValue(includes_field.1));
                        case null null;
                    };
                    let matching_rules : ?[FilteredStreamingTweetResponseMatchingRulesInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "matching_rules")) {
                        case (?matching_rules_field) ((switch (matching_rules_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<FilteredStreamingTweetResponseMatchingRulesInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = FilteredStreamingTweetResponseMatchingRulesInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        includes;
                        matching_rules;
                    };
                };
                case _ null;
            };
    };
};
