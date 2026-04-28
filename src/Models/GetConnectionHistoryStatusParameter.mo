import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetConnectionHistoryStatusParameter.mo
/// Enum values: #active, #inactive, #all

module {
    public type GetConnectionHistoryStatusParameter = {
        #active;
        #inactive;
        #all;
    };

    public module JSON {
        public func toCandidValue(value : GetConnectionHistoryStatusParameter) : Candid.Candid =
            switch (value) {
                case (#active) #Text("active");
                case (#inactive) #Text("inactive");
                case (#all) #Text("all");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetConnectionHistoryStatusParameter =
            switch (candid) {
                case (#Text("active")) ?#active;
                case (#Text("inactive")) ?#inactive;
                case (#Text("all")) ?#all;
                case _ null;
            };

        public func toText(value : GetConnectionHistoryStatusParameter) : Text =
            switch (value) {
                case (#active) "active";
                case (#inactive) "inactive";
                case (#all) "all";
            };
    };
};
