import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DisallowedResourceProblemAllOfSection.mo
/// Enum values: #data, #includes

module {
    public type DisallowedResourceProblemAllOfSection = {
        #data;
        #includes;
    };

    public module JSON {
        public func toCandidValue(value : DisallowedResourceProblemAllOfSection) : Candid.Candid =
            switch (value) {
                case (#data) #Text("data");
                case (#includes) #Text("includes");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?DisallowedResourceProblemAllOfSection =
            switch (candid) {
                case (#Text("data")) ?#data;
                case (#Text("includes")) ?#includes;
                case _ null;
            };

        public func toText(value : DisallowedResourceProblemAllOfSection) : Text =
            switch (value) {
                case (#data) "data";
                case (#includes) "includes";
            };
    };
};
