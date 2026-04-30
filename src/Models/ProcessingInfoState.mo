/// State of upload
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ProcessingInfoState.mo
/// Enum values: #succeeded, #in_progress, #pending, #failed

module {
    public type ProcessingInfoState = {
        #succeeded;
        #in_progress;
        #pending;
        #failed;
    };

    public module JSON {
        public func toCandidValue(value : ProcessingInfoState) : Candid.Candid =
            switch (value) {
                case (#succeeded) #Text("succeeded");
                case (#in_progress) #Text("in_progress");
                case (#pending) #Text("pending");
                case (#failed) #Text("failed");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ProcessingInfoState =
            switch (candid) {
                case (#Text("succeeded")) ?#succeeded;
                case (#Text("in_progress")) ?#in_progress;
                case (#Text("pending")) ?#pending;
                case (#Text("failed")) ?#failed;
                case _ null;
            };

        public func toText(value : ProcessingInfoState) : Text =
            switch (value) {
                case (#succeeded) "succeeded";
                case (#in_progress) "in_progress";
                case (#pending) "pending";
                case (#failed) "failed";
            };
    };
};
