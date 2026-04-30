/// Community Note rating status
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// NoteRatingStatus.mo
/// Enum values: #currently_rated_helpful, #currently_rated_not_helpful, #firm_reject, #insufficient_consensus, #minimum_ratings_not_met, #needs_more_ratings, #needs_your_help

module {
    public type NoteRatingStatus = {
        #currently_rated_helpful;
        #currently_rated_not_helpful;
        #firm_reject;
        #insufficient_consensus;
        #minimum_ratings_not_met;
        #needs_more_ratings;
        #needs_your_help;
    };

    public module JSON {
        public func toCandidValue(value : NoteRatingStatus) : Candid.Candid =
            switch (value) {
                case (#currently_rated_helpful) #Text("currently_rated_helpful");
                case (#currently_rated_not_helpful) #Text("currently_rated_not_helpful");
                case (#firm_reject) #Text("firm_reject");
                case (#insufficient_consensus) #Text("insufficient_consensus");
                case (#minimum_ratings_not_met) #Text("minimum_ratings_not_met");
                case (#needs_more_ratings) #Text("needs_more_ratings");
                case (#needs_your_help) #Text("needs_your_help");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?NoteRatingStatus =
            switch (candid) {
                case (#Text("currently_rated_helpful")) ?#currently_rated_helpful;
                case (#Text("currently_rated_not_helpful")) ?#currently_rated_not_helpful;
                case (#Text("firm_reject")) ?#firm_reject;
                case (#Text("insufficient_consensus")) ?#insufficient_consensus;
                case (#Text("minimum_ratings_not_met")) ?#minimum_ratings_not_met;
                case (#Text("needs_more_ratings")) ?#needs_more_ratings;
                case (#Text("needs_your_help")) ?#needs_your_help;
                case _ null;
            };

        public func toText(value : NoteRatingStatus) : Text =
            switch (value) {
                case (#currently_rated_helpful) "currently_rated_helpful";
                case (#currently_rated_not_helpful) "currently_rated_not_helpful";
                case (#firm_reject) "firm_reject";
                case (#insufficient_consensus) "insufficient_consensus";
                case (#minimum_ratings_not_met) "minimum_ratings_not_met";
                case (#needs_more_ratings) "needs_more_ratings";
                case (#needs_your_help) "needs_your_help";
            };
    };
};
