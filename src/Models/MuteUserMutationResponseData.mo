import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MuteUserMutationResponseData.mo

module {
    public type MuteUserMutationResponseData = {
        muting : ?Bool;
    };

    public module JSON {
        // `init` constructs a MuteUserMutationResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MuteUserMutationResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MuteUserMutationResponseData {
            let ?res = from_candid(to_candid(required)) : ?MuteUserMutationResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MuteUserMutationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.muting) {
                case (?v__) List.add(buf, ("muting", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MuteUserMutationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let muting : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "muting")) {
                        case (?muting_field) ((switch (muting_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        muting;
                    };
                };
                case _ null;
            };
    };
};
