import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// EvaluateNoteResponseData.mo

module {
    public type EvaluateNoteResponseData = {
        /// Claim opinion model score for the note.
        claim_opinion_score : ?Float;
    };

    public module JSON {
        // `init` constructs a EvaluateNoteResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { EvaluateNoteResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : EvaluateNoteResponseData {
            let ?res = from_candid(to_candid(required)) : ?EvaluateNoteResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : EvaluateNoteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.claim_opinion_score) {
                case (?v__) List.add(buf, ("claim_opinion_score", #Float(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EvaluateNoteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let claim_opinion_score : ?Float = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "claim_opinion_score")) {
                        case (?claim_opinion_score_field) ((switch (claim_opinion_score_field.1) { case (#Float(f)) ?f; case (#Int(i)) ?Float.fromInt(i); case (#Nat(n)) ?Float.fromInt(n); case _ null }));
                        case null null;
                    };
                    ?{
                        claim_opinion_score;
                    };
                };
                case _ null;
            };
    };
};
