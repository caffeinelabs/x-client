import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsageCapExceededProblemAllOfPeriod.mo
/// Enum values: #daily, #monthly

module {
    public type UsageCapExceededProblemAllOfPeriod = {
        #daily;
        #monthly;
    };

    public module JSON {
        public func toCandidValue(value : UsageCapExceededProblemAllOfPeriod) : Candid.Candid =
            switch (value) {
                case (#daily) #Text("Daily");
                case (#monthly) #Text("Monthly");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageCapExceededProblemAllOfPeriod =
            switch (candid) {
                case (#Text("Daily")) ?#daily;
                case (#Text("Monthly")) ?#monthly;
                case _ null;
            };

        public func toText(value : UsageCapExceededProblemAllOfPeriod) : Text =
            switch (value) {
                case (#daily) "Daily";
                case (#monthly) "Monthly";
            };
    };
};
