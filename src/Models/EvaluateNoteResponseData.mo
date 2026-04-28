import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// EvaluateNoteResponseData.mo

module {
    public type EvaluateNoteResponseData = {
        /// Claim opinion model score for the note.
        claim_opinion_score : ?Float;
    };

    public module JSON {
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
