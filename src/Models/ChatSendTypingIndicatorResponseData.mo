import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatSendTypingIndicatorResponseData.mo

module {
    public type ChatSendTypingIndicatorResponseData = {
        /// Whether the typing indicator was sent successfully.
        success : ?Bool;
    };

    public module JSON {
        // `init` constructs a ChatSendTypingIndicatorResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatSendTypingIndicatorResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatSendTypingIndicatorResponseData {
            let ?res = from_candid(to_candid(required)) : ?ChatSendTypingIndicatorResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatSendTypingIndicatorResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.success) {
                case (?v__) List.add(buf, ("success", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatSendTypingIndicatorResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let success : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success")) {
                        case (?success_field) ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        success;
                    };
                };
                case _ null;
            };
    };
};
