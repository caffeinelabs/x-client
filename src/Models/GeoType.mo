import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GeoType.mo
/// Enum values: #feature

module {
    public type GeoType = {
        #feature;
    };

    public module JSON {
        public func toCandidValue(value : GeoType) : Candid.Candid =
            switch (value) {
                case (#feature) #Text("Feature");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GeoType =
            switch (candid) {
                case (#Text("Feature")) ?#feature;
                case _ null;
            };

        public func toText(value : GeoType) : Text =
            switch (value) {
                case (#feature) "Feature";
            };
    };
};
