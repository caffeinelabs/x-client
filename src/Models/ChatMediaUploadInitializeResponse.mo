/// Response from initializing a Chat media upload.

import { type ChatMediaUploadInitializeResponseData; JSON = ChatMediaUploadInitializeResponseData } "./ChatMediaUploadInitializeResponseData";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMediaUploadInitializeResponse.mo

module {
    public type ChatMediaUploadInitializeResponse = {
        data : ?ChatMediaUploadInitializeResponseData;
    };

    public module JSON {
        // `init` constructs a ChatMediaUploadInitializeResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMediaUploadInitializeResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatMediaUploadInitializeResponse {
            let ?res = from_candid(to_candid(required)) : ?ChatMediaUploadInitializeResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMediaUploadInitializeResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", ChatMediaUploadInitializeResponseData.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadInitializeResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?ChatMediaUploadInitializeResponseData = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (ChatMediaUploadInitializeResponseData.fromCandidValue(data_field.1));
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
