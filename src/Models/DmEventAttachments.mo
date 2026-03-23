
// DmEventAttachments.mo
/// Specifies the type of attachments (if any) present in this DM.

module {
    // User-facing type: what application code uses
    public type DmEventAttachments = {
        /// A list of card IDs (if cards are attached).
        card_ids : ?[Text];
        /// A list of Media Keys for each one of the media attachments (if media are attached).
        media_keys : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DmEventAttachments type
        public type JSON = {
            card_ids : ?[Text];
            media_keys : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DmEventAttachments) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DmEventAttachments = ?json;
    }
}
