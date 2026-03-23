
import { type UrlImage; JSON = UrlImage } "./UrlImage";

import Int "mo:core/Int";

// UrlEntity.mo
/// Represent the portion of text recognized as a URL, and its start and end position within the text.

module {
    // User-facing type: what application code uses
    public type UrlEntity = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// Description of the URL landing page.
        description : ?Text;
        /// The URL as displayed in the X client.
        display_url : ?Text;
        /// A validly formatted URL.
        expanded_url : ?Text;
        images : ?[UrlImage];
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        /// HTTP Status Code.
        status : ?Nat;
        /// Title of the page the URL points to.
        title : ?Text;
        /// Fully resolved url.
        unwound_url : ?Text;
        /// A validly formatted URL.
        url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UrlEntity type
        public type JSON = {
            end : Int;
            start : Int;
            description : ?Text;
            display_url : ?Text;
            expanded_url : ?Text;
            images : ?[UrlImage];
            media_key : ?Text;
            status : ?Int;
            title : ?Text;
            unwound_url : ?Text;
            url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UrlEntity) : JSON = {
            end = value.end;
            start = value.start;
            description = value.description;
            display_url = value.display_url;
            expanded_url = value.expanded_url;
            images = value.images;
            media_key = value.media_key;
            status = value.status;
            title = value.title;
            unwound_url = value.unwound_url;
            url = value.url;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UrlEntity {
            ?{
                end = if (json.end < 0) return null else Int.abs(json.end);
                start = if (json.start < 0) return null else Int.abs(json.start);
                description = json.description;
                display_url = json.display_url;
                expanded_url = json.expanded_url;
                images = json.images;
                media_key = json.media_key;
                status = do ? { let v = json.status!; if (v < 0) return null else Int.abs(v) };
                title = json.title;
                unwound_url = json.unwound_url;
                url = json.url;
            }
        };
    }
}
