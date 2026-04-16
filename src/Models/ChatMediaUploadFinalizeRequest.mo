/// Request body for finalizing a Chat media upload.

// ChatMediaUploadFinalizeRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadFinalizeRequest = {
        /// XChat conversation identifier for the upload.
        conversation_id : ?Text;
        /// Media hash key returned from initialize.
        media_hash_key : ?Text;
        /// Optional message identifier associated with the upload.
        message_id : ?Text;
        /// Total number of uploaded parts as a numeric string.
        num_parts : ?Text;
        /// Optional TTL for the media in milliseconds.
        ttl_msec : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadFinalizeRequest type
        public type JSON = {
            conversation_id : ?Text;
            media_hash_key : ?Text;
            message_id : ?Text;
            num_parts : ?Text;
            ttl_msec : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadFinalizeRequest) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadFinalizeRequest = ?json;
    }
}
