
import Int "mo:core/Int";

// UrlImage.mo
/// Represent the information for the URL image.

module {
    // User-facing type: what application code uses
    public type UrlImage = {
        /// The height of the media in pixels.
        height : ?Nat;
        /// A validly formatted URL.
        url : ?Text;
        /// The width of the media in pixels.
        width : ?Nat;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UrlImage type
        public type JSON = {
            height : ?Int;
            url : ?Text;
            width : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UrlImage) : JSON = {
            height = value.height;
            url = value.url;
            width = value.width;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UrlImage {
            ?{
                height = do ? { let v = json.height!; if (v < 0) return null else Int.abs(v) };
                url = json.url;
                width = do ? { let v = json.width!; if (v < 0) return null else Int.abs(v) };
            }
        };
    }
}
