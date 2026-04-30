import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadRequestOneShotMedia.mo

module {
    public type MediaUploadRequestOneShotMedia = {
    };

    public module JSON {
        // `init` constructs a MediaUploadRequestOneShotMedia from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadRequestOneShotMedia.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaUploadRequestOneShotMedia {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadRequestOneShotMedia else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadRequestOneShotMedia) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadRequestOneShotMedia =
            switch (candid) {
                case (#Record(fields)) {
                    ?{
                    };
                };
                case _ null;
            };
    };
};
