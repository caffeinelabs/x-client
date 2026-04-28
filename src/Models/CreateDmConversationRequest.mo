
import { type CreateDmConversationRequestConversationType; JSON = CreateDmConversationRequestConversationType } "./CreateDmConversationRequestConversationType";

import { type CreateMessageRequest; JSON = CreateMessageRequest } "./CreateMessageRequest";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateDmConversationRequest.mo

module {
    public type CreateDmConversationRequest = {
        conversation_type : CreateDmConversationRequestConversationType;
        message : CreateMessageRequest;
        /// Participants for the DM Conversation.
        participant_ids : [Text];
    };

    public module JSON {
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
};
