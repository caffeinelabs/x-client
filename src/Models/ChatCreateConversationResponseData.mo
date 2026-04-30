import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatCreateConversationResponseData.mo

module {
    public type ChatCreateConversationResponseData = {
        /// The ID of the created conversation.
        conversation_id : ?Text;
        /// Sequence ID of the conversation key change event, if applicable.
        conversation_key_change_sequence_id : ?Text;
    };

    public module JSON {
        // `init` constructs a ChatCreateConversationResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatCreateConversationResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatCreateConversationResponseData {
            let ?res = from_candid(to_candid(required)) : ?ChatCreateConversationResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatCreateConversationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            switch (value.conversation_key_change_sequence_id) {
                case (?v__) List.add(buf, ("conversation_key_change_sequence_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatCreateConversationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let conversation_key_change_sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_change_sequence_id")) {
                        case (?conversation_key_change_sequence_id_field) ((switch (conversation_key_change_sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        conversation_id;
                        conversation_key_change_sequence_id;
                    };
                };
                case _ null;
            };
    };
};
