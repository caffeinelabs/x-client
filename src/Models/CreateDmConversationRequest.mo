
import { type CreateDmConversationRequestConversationType; JSON = CreateDmConversationRequestConversationType } "./CreateDmConversationRequestConversationType";

import { type CreateMessageRequest; JSON = CreateMessageRequest } "./CreateMessageRequest";

// CreateDmConversationRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateDmConversationRequest = {
        conversation_type : CreateDmConversationRequestConversationType;
        message : CreateMessageRequest;
        /// Participants for the DM Conversation.
        participant_ids : [Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateDmConversationRequest type
        public type JSON = {
            conversation_type : CreateDmConversationRequestConversationType.JSON;
            message : CreateMessageRequest;
            participant_ids : [Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateDmConversationRequest) : JSON = { value with
            conversation_type = CreateDmConversationRequestConversationType.toJSON(value.conversation_type);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateDmConversationRequest {
            let ?conversation_type = CreateDmConversationRequestConversationType.fromJSON(json.conversation_type) else return null;
            ?{ json with
                conversation_type;
            }
        };
    }
}
