/// Status of a compliance job.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ComplianceJobStatus.mo
/// Enum values: #created, #in_progress, #failed, #complete, #expired

module {
    public type ComplianceJobStatus = {
        #created;
        #in_progress;
        #failed;
        #complete;
        #expired;
    };

    public module JSON {
        public func toCandidValue(value : ComplianceJobStatus) : Candid.Candid =
            switch (value) {
                case (#created) #Text("created");
                case (#in_progress) #Text("in_progress");
                case (#failed) #Text("failed");
                case (#complete) #Text("complete");
                case (#expired) #Text("expired");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ComplianceJobStatus =
            switch (candid) {
                case (#Text("created")) ?#created;
                case (#Text("in_progress")) ?#in_progress;
                case (#Text("failed")) ?#failed;
                case (#Text("complete")) ?#complete;
                case (#Text("expired")) ?#expired;
                case _ null;
            };

        public func toText(value : ComplianceJobStatus) : Text =
            switch (value) {
                case (#created) "created";
                case (#in_progress) "in_progress";
                case (#failed) "failed";
                case (#complete) "complete";
                case (#expired) "expired";
            };
    };
};
