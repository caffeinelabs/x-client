import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetPostsCountsAllGranularityParameter.mo
/// Enum values: #minute, #hour, #day

module {
    public type GetPostsCountsAllGranularityParameter = {
        #minute;
        #hour;
        #day;
    };

    public module JSON {
        public func toCandidValue(value : GetPostsCountsAllGranularityParameter) : Candid.Candid =
            switch (value) {
                case (#minute) #Text("minute");
                case (#hour) #Text("hour");
                case (#day) #Text("day");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetPostsCountsAllGranularityParameter =
            switch (candid) {
                case (#Text("minute")) ?#minute;
                case (#Text("hour")) ?#hour;
                case (#Text("day")) ?#day;
                case _ null;
            };

        public func toText(value : GetPostsCountsAllGranularityParameter) : Text =
            switch (value) {
                case (#minute) "minute";
                case (#hour) "hour";
                case (#day) "day";
            };
    };
};
