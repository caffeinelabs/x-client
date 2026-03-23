
import { type Media; JSON = Media } "./Media";

import Int "mo:core/Int";

// Photo.mo

module {
    // User-facing type: what application code uses
    public type Photo = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        type_ : Text;
        /// The width of the media in pixels.
        width : ?Nat;
        alt_text : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Photo type
        public type JSON = {
            height : ?Int;
            media_key : ?Text;
            type_ : Text;
            width : ?Int;
            alt_text : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Photo) : JSON = {
            height = value.height;
            media_key = value.media_key;
            type_ = value.type_;
            width = value.width;
            alt_text = value.alt_text;
            url = value.url;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Photo {
            ?{
                height = do ? { let v = json.height!; if (v < 0) return null else Int.abs(v) };
                media_key = json.media_key;
                type_ = json.type_;
                width = do ? { let v = json.width!; if (v < 0) return null else Int.abs(v) };
                alt_text = json.alt_text;
                url = json.url;
            }
        };
    }
}
