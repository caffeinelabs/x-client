
import { type Sticker; JSON = Sticker } "./Sticker";

// StickerInfo.mo

module {
    // User-facing type: what application code uses
    public type StickerInfo = {
        /// Stickers list must not be empty and should not exceed 25
        stickers : [Sticker];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StickerInfo type
        public type JSON = {
            stickers : [Sticker];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StickerInfo) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StickerInfo = ?json;
    }
}
