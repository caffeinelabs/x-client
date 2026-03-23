
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";

// ChatInitializeConversationKeysRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatInitializeConversationKeysRequest = {
        /// Cryptographic signatures for the key initialization action.
        action_signatures : ?[ChatActionSignature];
        /// Base64-encoded key rotation payload for ratchet tree key management.
        base64_encoded_key_rotation : ?Text;
        /// Version of the conversation encryption key (typically a timestamp in milliseconds).
        conversation_key_version : Text;
        /// The conversation key encrypted for each participant using their public key.
        conversation_participant_keys : [ChatConversationParticipantKey];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatInitializeConversationKeysRequest type
        public type JSON = {
            action_signatures : ?[ChatActionSignature];
            base64_encoded_key_rotation : ?Text;
            conversation_key_version : Text;
            conversation_participant_keys : [ChatConversationParticipantKey];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatInitializeConversationKeysRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatInitializeConversationKeysRequest = ?json;
    }
}
