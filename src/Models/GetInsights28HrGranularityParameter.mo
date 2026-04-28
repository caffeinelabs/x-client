import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetInsights28HrGranularityParameter.mo
/// Enum values: #daily, #hourly, #weekly, #total

module {
    public type GetInsights28HrGranularityParameter = {
        #daily;
        #hourly;
        #weekly;
        #total;
    };

    public module JSON {
        public func toCandidValue(value : GetInsights28HrGranularityParameter) : Candid.Candid =
            switch (value) {
                case (#daily) #Text("Daily");
                case (#hourly) #Text("Hourly");
                case (#weekly) #Text("Weekly");
                case (#total) #Text("Total");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetInsights28HrGranularityParameter =
            switch (candid) {
                case (#Text("Daily")) ?#daily;
                case (#Text("Hourly")) ?#hourly;
                case (#Text("Weekly")) ?#weekly;
                case (#Text("Total")) ?#total;
                case _ null;
            };

        public func toText(value : GetInsights28HrGranularityParameter) : Text =
            switch (value) {
                case (#daily) "Daily";
                case (#hourly) "Hourly";
                case (#weekly) "Weekly";
                case (#total) "Total";
            };
    };
};
