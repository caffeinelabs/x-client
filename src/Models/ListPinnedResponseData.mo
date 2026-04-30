import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ListPinnedResponseData.mo

module {
    public type ListPinnedResponseData = {
        pinned : ?Bool;
    };

    public module JSON {
        // `init` constructs a ListPinnedResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ListPinnedResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ListPinnedResponseData {
            let ?res = from_candid(to_candid(required)) : ?ListPinnedResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ListPinnedResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.pinned) {
                case (?v__) List.add(buf, ("pinned", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListPinnedResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let pinned : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "pinned")) {
                        case (?pinned_field) ((switch (pinned_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        pinned;
                    };
                };
                case _ null;
            };
    };
};
