import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PollVotingStatus.mo
/// Enum values: #open, #closed

module {
    public type PollVotingStatus = {
        #open;
        #closed;
    };

    public module JSON {
        public func toCandidValue(value : PollVotingStatus) : Candid.Candid =
            switch (value) {
                case (#open) #Text("open");
                case (#closed) #Text("closed");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?PollVotingStatus =
            switch (candid) {
                case (#Text("open")) ?#open;
                case (#Text("closed")) ?#closed;
                case _ null;
            };

        public func toText(value : PollVotingStatus) : Text =
            switch (value) {
                case (#open) "open";
                case (#closed) "closed";
            };
    };
};
