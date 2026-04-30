import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatMarkConversationReadRequest.mo

module {
    public type ChatMarkConversationReadRequest = {
        /// The sequence ID of the last message to mark as read up to.
        seen_until_sequence_id : Text;
    };

    public module JSON {
        // `init` constructs a ChatMarkConversationReadRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatMarkConversationReadRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            seen_until_sequence_id : Text;
        }) : ChatMarkConversationReadRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatMarkConversationReadRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatMarkConversationReadRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("seen_until_sequence_id", #Text(value.seen_until_sequence_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMarkConversationReadRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?seen_until_sequence_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "seen_until_sequence_id") else return null;
                    let ?seen_until_sequence_id = ((switch (seen_until_sequence_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        seen_until_sequence_id;
                    };
                };
                case _ null;
            };
    };
};
