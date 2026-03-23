
import Int "mo:core/Int";

// MentionEntity.mo

module {
    // User-facing type: what application code uses
    public type MentionEntity = {
        /// Index (zero-based) at which position this entity ends.  The index is exclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// The X handle (screen name) of this user.
        username : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MentionEntity type
        public type JSON = {
            end : Int;
            start : Int;
            id : ?Text;
            username : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MentionEntity) : JSON = {
            end = value.end;
            start = value.start;
            id = value.id;
            username = value.username;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MentionEntity {
            ?{
                end = if (json.end < 0) return null else Int.abs(json.end);
                start = if (json.start < 0) return null else Int.abs(json.start);
                id = json.id;
                username = json.username;
            }
        };
    }
}
