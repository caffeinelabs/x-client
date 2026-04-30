import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AudiencePolicyCreatorSubscriptionsInner.mo
/// Enum values: #any_

module {
    public type AudiencePolicyCreatorSubscriptionsInner = {
        #any_;
    };

    public module JSON {
        public func toCandidValue(value : AudiencePolicyCreatorSubscriptionsInner) : Candid.Candid =
            switch (value) {
                case (#any_) #Text("Any");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?AudiencePolicyCreatorSubscriptionsInner =
            switch (candid) {
                case (#Text("Any")) ?#any_;
                case _ null;
            };

        public func toText(value : AudiencePolicyCreatorSubscriptionsInner) : Text =
            switch (value) {
                case (#any_) "Any";
            };
    };
};
