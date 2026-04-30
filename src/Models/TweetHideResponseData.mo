import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetHideResponseData.mo

module {
    public type TweetHideResponseData = {
        hidden : ?Bool;
    };

    public module JSON {
        // `init` constructs a TweetHideResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetHideResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetHideResponseData {
            let ?res = from_candid(to_candid(required)) : ?TweetHideResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetHideResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.hidden) {
                case (?v__) List.add(buf, ("hidden", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetHideResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let hidden : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hidden")) {
                        case (?hidden_field) ((switch (hidden_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        hidden;
                    };
                };
                case _ null;
            };
    };
};
