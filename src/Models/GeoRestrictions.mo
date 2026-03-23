
import { type GeoRestrictionsOneOf; JSON = GeoRestrictionsOneOf } "./GeoRestrictionsOneOf";

import { type GeoRestrictionsOneOf1; JSON = GeoRestrictionsOneOf1 } "./GeoRestrictionsOneOf1";

// GeoRestrictions.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type GeoRestrictions = {
        #GeoRestrictionsOneOf : GeoRestrictionsOneOf;
        #GeoRestrictionsOneOf1 : GeoRestrictionsOneOf1;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : GeoRestrictions) : Text =
            switch (value) {
                case (#GeoRestrictionsOneOf(v)) Runtime.unreachable();
                case (#GeoRestrictionsOneOf1(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GeoRestrictions type
        public type JSON = {
            #GeoRestrictionsOneOf : GeoRestrictionsOneOf;
            #GeoRestrictionsOneOf1 : GeoRestrictionsOneOf1;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GeoRestrictions) : JSON =
            switch (value) {
                case (#GeoRestrictionsOneOf(v)) #GeoRestrictionsOneOf(v);
                case (#GeoRestrictionsOneOf1(v)) #GeoRestrictionsOneOf1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GeoRestrictions =
            switch (json) {
                case (#GeoRestrictionsOneOf(v)) ?#GeoRestrictionsOneOf(v);
                case (#GeoRestrictionsOneOf1(v)) ?#GeoRestrictionsOneOf1(v);
            };
    }
}
