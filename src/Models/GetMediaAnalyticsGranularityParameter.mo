import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetMediaAnalyticsGranularityParameter.mo
/// Enum values: #hourly, #daily, #total

module {
    public type GetMediaAnalyticsGranularityParameter = {
        #hourly;
        #daily;
        #total;
    };

    public module JSON {
        public func toCandidValue(value : GetMediaAnalyticsGranularityParameter) : Candid.Candid =
            switch (value) {
                case (#hourly) #Text("hourly");
                case (#daily) #Text("daily");
                case (#total) #Text("total");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetMediaAnalyticsGranularityParameter =
            switch (candid) {
                case (#Text("hourly")) ?#hourly;
                case (#Text("daily")) ?#daily;
                case (#Text("total")) ?#total;
                case _ null;
            };

        public func toText(value : GetMediaAnalyticsGranularityParameter) : Text =
            switch (value) {
                case (#hourly) "hourly";
                case (#daily) "daily";
                case (#total) "total";
            };
    };
};
