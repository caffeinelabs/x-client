import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetHideRequest.mo

module {
    public type TweetHideRequest = {
        hidden : Bool;
    };

    public module JSON {
        // `init` constructs a TweetHideRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetHideRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            hidden : Bool;
        }) : TweetHideRequest {
            let ?res = from_candid(to_candid(required)) : ?TweetHideRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetHideRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hidden", #Bool(value.hidden)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetHideRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?hidden_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hidden") else return null;
                    let ?hidden = ((switch (hidden_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        hidden;
                    };
                };
                case _ null;
            };
    };
};
