import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// BookmarkMutationResponseData.mo

module {
    public type BookmarkMutationResponseData = {
        bookmarked : ?Bool;
    };

    public module JSON {
        // `init` constructs a BookmarkMutationResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { BookmarkMutationResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : BookmarkMutationResponseData {
            let ?res = from_candid(to_candid(required)) : ?BookmarkMutationResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : BookmarkMutationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.bookmarked) {
                case (?v__) List.add(buf, ("bookmarked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?BookmarkMutationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let bookmarked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "bookmarked")) {
                        case (?bookmarked_field) ((switch (bookmarked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        bookmarked;
                    };
                };
                case _ null;
            };
    };
};
