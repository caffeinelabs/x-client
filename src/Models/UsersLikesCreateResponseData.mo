import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsersLikesCreateResponseData.mo

module {
    public type UsersLikesCreateResponseData = {
        liked : ?Bool;
    };

    public module JSON {
        // `init` constructs a UsersLikesCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsersLikesCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : UsersLikesCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?UsersLikesCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsersLikesCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.liked) {
                case (?v__) List.add(buf, ("liked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersLikesCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let liked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "liked")) {
                        case (?liked_field) ((switch (liked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        liked;
                    };
                };
                case _ null;
            };
    };
};
