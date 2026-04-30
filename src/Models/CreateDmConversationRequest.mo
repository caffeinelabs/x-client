
import { type CreateDmConversationRequestConversationType; JSON = CreateDmConversationRequestConversationType } "./CreateDmConversationRequestConversationType";

import { type CreateMessageRequest; JSON = CreateMessageRequest } "./CreateMessageRequest";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateDmConversationRequest.mo

module {
    /// The required-fields slice of CreateDmConversationRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        conversation_type : CreateDmConversationRequestConversationType;
        message : CreateMessageRequest;
        /// Participants for the DM Conversation.
        participant_ids : [Text];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateDmConversationRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateDmConversationRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateDmConversationRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateDmConversationRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateDmConversationRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateDmConversationRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateDmConversationRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("conversation_type", CreateDmConversationRequestConversationType.toCandidValue(value.conversation_type)));
            List.add(buf, ("message", CreateMessageRequest.toCandidValue(value.message)));
            List.add(buf, ("participant_ids", #Array(Array.map<Text, Candid.Candid>(value.participant_ids, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateDmConversationRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?conversation_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_type") else return null;
                    let ?conversation_type = (CreateDmConversationRequestConversationType.fromCandidValue(conversation_type_field.1)) else return null;
                    let ?message_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message") else return null;
                    let ?message = (CreateMessageRequest.fromCandidValue(message_field.1)) else return null;
                    let ?participant_ids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "participant_ids") else return null;
                    let ?participant_ids = ((switch (participant_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        conversation_type;
                        message;
                        participant_ids;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
