import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadFinalizeResponseData.mo

module {
    public type ChatMediaUploadFinalizeResponseData = {
        /// Whether the finalize request succeeded.
        success : Bool;
    };

    public module JSON {
        // `init` constructs a ChatMediaUploadFinalizeResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadFinalizeResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            success : Bool;
        }) : ChatMediaUploadFinalizeResponseData {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadFinalizeResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadFinalizeResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("success", #Bool(value.success)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadFinalizeResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?success_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success") else return null;
                    let ?success = ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        success;
                    };
                };
                case _ null;
            };
    };
};
