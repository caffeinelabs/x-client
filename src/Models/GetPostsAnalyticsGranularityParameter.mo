import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetPostsAnalyticsGranularityParameter.mo
/// Enum values: #hourly, #daily, #weekly, #total

module {
    public type GetPostsAnalyticsGranularityParameter = {
        #hourly;
        #daily;
        #weekly;
        #total;
    };

    public module JSON {
        public func toCandidValue(value : GetPostsAnalyticsGranularityParameter) : Candid.Candid =
            switch (value) {
                case (#hourly) #Text("hourly");
                case (#daily) #Text("daily");
                case (#weekly) #Text("weekly");
                case (#total) #Text("total");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetPostsAnalyticsGranularityParameter =
            switch (candid) {
                case (#Text("hourly")) ?#hourly;
                case (#Text("daily")) ?#daily;
                case (#Text("weekly")) ?#weekly;
                case (#Text("total")) ?#total;
                case _ null;
            };

        public func toText(value : GetPostsAnalyticsGranularityParameter) : Text =
            switch (value) {
                case (#hourly) "hourly";
                case (#daily) "daily";
                case (#weekly) "weekly";
                case (#total) "total";
            };
    };
};
