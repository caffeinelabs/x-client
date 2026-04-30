/// Response from finalizing a Chat media upload.

import { type ChatMediaUploadFinalizeResponseData; JSON = ChatMediaUploadFinalizeResponseData } "./ChatMediaUploadFinalizeResponseData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadFinalizeResponse.mo

module {
    public type ChatMediaUploadFinalizeResponse = {
        data : ?ChatMediaUploadFinalizeResponseData;
    };

    public module JSON {
        // `init` constructs a ChatMediaUploadFinalizeResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadFinalizeResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatMediaUploadFinalizeResponse {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadFinalizeResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadFinalizeResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", ChatMediaUploadFinalizeResponseData.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadFinalizeResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?ChatMediaUploadFinalizeResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (ChatMediaUploadFinalizeResponseData.fromCandidValue(data_field.1));
                        case null null;
                    };
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
