
// TweetEditControls.mo

module {
    // User-facing type: what application code uses
    public type TweetEditControls = {
        /// Time when Tweet is no longer editable.
        editable_until : Text;
        /// Number of times this Tweet can be edited.
        edits_remaining : Int;
        /// Indicates if this Tweet is eligible to be edited.
        is_edit_eligible : Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetEditControls type
        public type JSON = {
            editable_until : Text;
            edits_remaining : Int;
            is_edit_eligible : Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetEditControls) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetEditControls = ?json;
    }
}
