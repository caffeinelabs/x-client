import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetComplianceJobsStatusParameter.mo
/// Enum values: #created, #in_progress, #failed, #complete

module {
    public type GetComplianceJobsStatusParameter = {
        #created;
        #in_progress;
        #failed;
        #complete;
    };

    public module JSON {
        public func toCandidValue(value : GetComplianceJobsStatusParameter) : Candid.Candid =
            switch (value) {
                case (#created) #Text("created");
                case (#in_progress) #Text("in_progress");
                case (#failed) #Text("failed");
                case (#complete) #Text("complete");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetComplianceJobsStatusParameter =
            switch (candid) {
                case (#Text("created")) ?#created;
                case (#Text("in_progress")) ?#in_progress;
                case (#Text("failed")) ?#failed;
                case (#Text("complete")) ?#complete;
                case _ null;
            };

        public func toText(value : GetComplianceJobsStatusParameter) : Text =
            switch (value) {
                case (#created) "created";
                case (#in_progress) "in_progress";
                case (#failed) "failed";
                case (#complete) "complete";
            };
    };
};
