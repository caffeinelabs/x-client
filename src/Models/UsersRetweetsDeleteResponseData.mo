import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsersRetweetsDeleteResponseData.mo

module {
    public type UsersRetweetsDeleteResponseData = {
        retweeted : ?Bool;
    };

    public module JSON {
        // `init` constructs a UsersRetweetsDeleteResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsersRetweetsDeleteResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : UsersRetweetsDeleteResponseData {
            let ?res = from_candid(to_candid(required)) : ?UsersRetweetsDeleteResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsersRetweetsDeleteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.retweeted) {
                case (?v__) List.add(buf, ("retweeted", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersRetweetsDeleteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let retweeted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweeted")) {
                        case (?retweeted_field) ((switch (retweeted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        retweeted;
                    };
                };
                case _ null;
            };
    };
};
