/// Describes a choice in a Poll object.

// PollOption.mo

module {
    // User-facing type: what application code uses
    public type PollOption = {
        /// The text of a poll choice.
        label_ : Text;
        /// Position of this choice in the poll.
        position : Int;
        /// Number of users who voted for this choice.
        votes : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PollOption type
        public type JSON = {
            label_ : Text;
            position : Int;
            votes : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PollOption) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PollOption = ?json;
    }
}
