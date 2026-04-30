
import { type GeoRestrictionsOneOf; JSON = GeoRestrictionsOneOf } "./GeoRestrictionsOneOf";

import { type GeoRestrictionsOneOf1; JSON = GeoRestrictionsOneOf1 } "./GeoRestrictionsOneOf1";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GeoRestrictions.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type GeoRestrictions = {
        #GeoRestrictionsOneOf : GeoRestrictionsOneOf;
        #GeoRestrictionsOneOf1 : GeoRestrictionsOneOf1;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : GeoRestrictions) : Text =
            switch (value) {
                case (#GeoRestrictionsOneOf(v)) Runtime.unreachable();
                case (#GeoRestrictionsOneOf1(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : GeoRestrictions) : Candid.Candid =
            switch (value) {
                case (#GeoRestrictionsOneOf(v)) #Variant(("GeoRestrictionsOneOf", GeoRestrictionsOneOf.toCandidValue(v)));
                case (#GeoRestrictionsOneOf1(v)) #Variant(("GeoRestrictionsOneOf1", GeoRestrictionsOneOf1.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GeoRestrictions =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("GeoRestrictionsOneOf") {
                            let ?inner = GeoRestrictionsOneOf.fromCandidValue(tagAndVal.1) else return null;
                            ?#GeoRestrictionsOneOf(inner)
                        };
                        case ("GeoRestrictionsOneOf1") {
                            let ?inner = GeoRestrictionsOneOf1.fromCandidValue(tagAndVal.1) else return null;
                            ?#GeoRestrictionsOneOf1(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
