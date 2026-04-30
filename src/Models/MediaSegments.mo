import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// MediaSegments.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type MediaSegments = {
        #one_of_0 : Nat;
        #one_of_1 : Int;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : MediaSegments) : Text =
            switch (value) {
                case (#one_of_0(v)) Int.toText(v);
                case (#one_of_1(v)) Int.toText(v);
            };

        public func toCandidValue(value : MediaSegments) : Candid.Candid =
            switch (value) {
                case (#one_of_0(v)) #Variant(("one_of_0", #Int(v)));
                case (#one_of_1(v)) #Variant(("one_of_1", #Int(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaSegments =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("one_of_0") {
                            let #Int(v) = tagAndVal.1 else return null;
                            if (v < 0) return null;
                            ?#one_of_0(Int.abs(v))
                        };
                        case ("one_of_1") {
                            let #Int(v) = tagAndVal.1 else return null;
                            ?#one_of_1(v)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
