import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// FilteredStreamingTweetResponseMatchingRulesInner.mo

module {
    public type FilteredStreamingTweetResponseMatchingRulesInner = {
        /// Unique identifier of this rule.
        id : Text;
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
    };

    public module JSON {
        // `init` constructs a FilteredStreamingTweetResponseMatchingRulesInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { FilteredStreamingTweetResponseMatchingRulesInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            id : Text;
        }) : FilteredStreamingTweetResponseMatchingRulesInner {
            let ?res = from_candid(to_candid(required)) : ?FilteredStreamingTweetResponseMatchingRulesInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : FilteredStreamingTweetResponseMatchingRulesInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FilteredStreamingTweetResponseMatchingRulesInner =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        id;
                        tag;
                    };
                };
                case _ null;
            };
    };
};
