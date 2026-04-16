/// Request body for initializing a Chat media upload.

import Int "mo:core/Int";

// ChatMediaUploadInitializeRequest.mo

module {
    // User-facing type: what application code uses
    public type ChatMediaUploadInitializeRequest = {
        /// XChat conversation identifier for the upload.
        conversation_id : ?Text;
        /// Total size of the media upload in bytes.
        total_bytes : ?Nat;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ChatMediaUploadInitializeRequest type
        public type JSON = {
            conversation_id : ?Text;
            total_bytes : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ChatMediaUploadInitializeRequest) : JSON = {
            conversation_id = value.conversation_id;
            total_bytes = value.total_bytes;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ChatMediaUploadInitializeRequest {
            ?{
                conversation_id = json.conversation_id;
                total_bytes = do ? { let v = json.total_bytes!; if (v < 0) return null else Int.abs(v) };
            }
        };
    }
}
