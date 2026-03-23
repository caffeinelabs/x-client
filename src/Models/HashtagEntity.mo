
import Int "mo:core/Int";

// HashtagEntity.mo

module {
    // User-facing type: what application code uses
    public type HashtagEntity = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// The text of the Hashtag.
        tag : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer HashtagEntity type
        public type JSON = {
            end : Int;
            start : Int;
            tag : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : HashtagEntity) : JSON = {
            end = value.end;
            start = value.start;
            tag = value.tag;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?HashtagEntity {
            ?{
                end = if (json.end < 0) return null else Int.abs(json.end);
                start = if (json.start < 0) return null else Int.abs(json.start);
                tag = json.tag;
            }
        };
    }
}
