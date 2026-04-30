import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadAppendResponseData.mo

module {
    public type MediaUploadAppendResponseData = {
        /// Unix epoch time in seconds after when the upload session expires.
        expires_at : ?Int;
    };

    public module JSON {
        // `init` constructs a MediaUploadAppendResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadAppendResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaUploadAppendResponseData {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadAppendResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadAppendResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.expires_at) {
                case (?v__) List.add(buf, ("expires_at", #Int(v__)#Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadAppendResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let expires_at : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "expires_at")) {
                        case (?expires_at_field) ((switch (expires_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })(switch (expires_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        expires_at;
                    };
                };
                case _ null;
            };
    };
};
