
import Int "mo:core/Int";

// EntityIndicesInclusiveInclusive.mo
/// Represent a boundary range (start and end index) for a recognized entity (for example a hashtag or a mention). `start` must be smaller than `end`.  The start index is inclusive, the end index is inclusive.

module {
    // User-facing type: what application code uses
    public type EntityIndicesInclusiveInclusive = {
        /// Index (zero-based) at which position this entity ends.  The index is inclusive.
        end : Nat;
        /// Index (zero-based) at which position this entity starts.  The index is inclusive.
        start : Nat;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer EntityIndicesInclusiveInclusive type
        public type JSON = {
            end : Int;
            start : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : EntityIndicesInclusiveInclusive) : JSON = {
            end = value.end;
            start = value.start;
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?EntityIndicesInclusiveInclusive {
            ?{
                end = if (json.end < 0) return null else Int.abs(json.end);
                start = if (json.start < 0) return null else Int.abs(json.start);
            }
        };
    }
}
