
// DmMediaAttachment.mo

module {
    // User-facing type: what application code uses
    public type DmMediaAttachment = {
        /// The unique identifier of this Media.
        media_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DmMediaAttachment type
        public type JSON = {
            media_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DmMediaAttachment) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DmMediaAttachment = ?json;
    }
}
