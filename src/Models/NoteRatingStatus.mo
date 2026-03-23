
// NoteRatingStatus.mo
/// Community Note rating status
/// Enum values: #currently_rated_helpful, #currently_rated_not_helpful, #firm_reject, #insufficient_consensus, #minimum_ratings_not_met, #needs_more_ratings, #needs_your_help

module {
    // User-facing type: type-safe variants for application code
    public type NoteRatingStatus = {
        #currently_rated_helpful;
        #currently_rated_not_helpful;
        #firm_reject;
        #insufficient_consensus;
        #minimum_ratings_not_met;
        #needs_more_ratings;
        #needs_your_help;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer NoteRatingStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : NoteRatingStatus) : JSON =
            switch (value) {
                case (#currently_rated_helpful) "currently_rated_helpful";
                case (#currently_rated_not_helpful) "currently_rated_not_helpful";
                case (#firm_reject) "firm_reject";
                case (#insufficient_consensus) "insufficient_consensus";
                case (#minimum_ratings_not_met) "minimum_ratings_not_met";
                case (#needs_more_ratings) "needs_more_ratings";
                case (#needs_your_help) "needs_your_help";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?NoteRatingStatus =
            switch (json) {
                case "currently_rated_helpful" ?#currently_rated_helpful;
                case "currently_rated_not_helpful" ?#currently_rated_not_helpful;
                case "firm_reject" ?#firm_reject;
                case "insufficient_consensus" ?#insufficient_consensus;
                case "minimum_ratings_not_met" ?#minimum_ratings_not_met;
                case "needs_more_ratings" ?#needs_more_ratings;
                case "needs_your_help" ?#needs_your_help;
                case _ null;
            };
    }
}
