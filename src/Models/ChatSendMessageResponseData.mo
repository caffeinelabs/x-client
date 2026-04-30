import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatSendMessageResponseData.mo

module {
    public type ChatSendMessageResponseData = {
        /// Base64-encoded response message event.
        encoded_message_event : ?Text;
    };

    public module JSON {
        // `init` constructs a ChatSendMessageResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatSendMessageResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatSendMessageResponseData {
            let ?res = from_candid(to_candid(required)) : ?ChatSendMessageResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatSendMessageResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.encoded_message_event) {
                case (?v__) List.add(buf, ("encoded_message_event", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatSendMessageResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let encoded_message_event : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encoded_message_event")) {
                        case (?encoded_message_event_field) ((switch (encoded_message_event_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        encoded_message_event;
                    };
                };
                case _ null;
            };
    };
};
