
import { type DmMediaAttachment; JSON = DmMediaAttachment } "./DmMediaAttachment";

// CreateAttachmentsMessageRequest.mo

module {
    // User-facing type: what application code uses
    public type CreateAttachmentsMessageRequest = {
        /// Attachments to a DM Event.
        attachments : [DmMediaAttachment];
        /// Text of the message.
        text_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateAttachmentsMessageRequest type
        public type JSON = {
            attachments : [DmMediaAttachment];
            text_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateAttachmentsMessageRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateAttachmentsMessageRequest = ?json;
    }
}
