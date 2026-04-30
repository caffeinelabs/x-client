import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SearchSpacesStateParameter.mo
/// Enum values: #live, #scheduled, #all

module {
    public type SearchSpacesStateParameter = {
        #live;
        #scheduled;
        #all;
    };

    public module JSON {
        public func toCandidValue(value : SearchSpacesStateParameter) : Candid.Candid =
            switch (value) {
                case (#live) #Text("live");
                case (#scheduled) #Text("scheduled");
                case (#all) #Text("all");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SearchSpacesStateParameter =
            switch (candid) {
                case (#Text("live")) ?#live;
                case (#Text("scheduled")) ?#scheduled;
                case (#Text("all")) ?#all;
                case _ null;
            };

        public func toText(value : SearchSpacesStateParameter) : Text =
            switch (value) {
                case (#live) "live";
                case (#scheduled) "scheduled";
                case (#all) "all";
            };
    };
};
