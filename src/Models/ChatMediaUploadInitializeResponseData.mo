
// ChatMediaUploadInitializeResponseData.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadInitializeResponseData = {
        /// Conversation id associated with the upload.
        conversation_id : Text;
        /// Media hash key returned by XChat.
        media_hash_key : Text;
        /// Resume/session id for the upload.
        session_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadInitializeResponseData type
        public type JSON = {
            conversation_id : Text;
            media_hash_key : Text;
            session_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadInitializeResponseData) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadInitializeResponseData = ?json;
    }
}
