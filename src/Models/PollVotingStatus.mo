
// PollVotingStatus.mo
/// Enum values: #open, #closed

module {
    // User-facing type: type-safe variants for application code
    public type PollVotingStatus = {
        #open;
        #closed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer PollVotingStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : PollVotingStatus) : JSON =
            switch (value) {
                case (#open) "open";
                case (#closed) "closed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?PollVotingStatus =
            switch (json) {
                case "open" ?#open;
                case "closed" ?#closed;
                case _ null;
            };
    }
}
