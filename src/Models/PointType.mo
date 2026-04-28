import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PointType.mo
/// Enum values: #point

module {
    public type PointType = {
        #point;
    };

    public module JSON {
        public func toCandidValue(value : PointType) : Candid.Candid =
            switch (value) {
                case (#point) #Text("Point");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?PointType =
            switch (candid) {
                case (#Text("Point")) ?#point;
                case _ null;
            };

        public func toText(value : PointType) : Text =
            switch (value) {
                case (#point) "Point";
            };
    };
};
