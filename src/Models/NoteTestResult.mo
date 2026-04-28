/// The evaluation result of a community note.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NoteTestResult.mo

module {
    public type NoteTestResult = {
        /// Score bucket from the evaluator result.
        evaluator_score_bucket : ?Text;
        /// The type of the evaluator.
        evaluator_type : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : NoteTestResult) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.evaluator_score_bucket) {
                case (?v__) List.add(buf, ("evaluator_score_bucket", #Text(v__)));
                case null ();
            };
            switch (value.evaluator_type) {
                case (?v__) List.add(buf, ("evaluator_type", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NoteTestResult =
            switch (candid) {
                case (#Record(fields)) {
                    let evaluator_score_bucket : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "evaluator_score_bucket")) {
                        case (?evaluator_score_bucket_field) ((switch (evaluator_score_bucket_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let evaluator_type : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "evaluator_type")) {
                        case (?evaluator_type_field) ((switch (evaluator_type_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        evaluator_score_bucket;
                        evaluator_type;
                    };
                };
                case _ null;
            };
    };
};
