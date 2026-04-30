/// The X Blue subscription type of the user, eg: Basic, Premium, PremiumPlus or None.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserSubscriptionType.mo
/// Enum values: #basic, #premium, #premiumplus, #none_

module {
    public type UserSubscriptionType = {
        #basic;
        #premium;
        #premiumplus;
        #none_;
    };

    public module JSON {
        public func toCandidValue(value : UserSubscriptionType) : Candid.Candid =
            switch (value) {
                case (#basic) #Text("Basic");
                case (#premium) #Text("Premium");
                case (#premiumplus) #Text("PremiumPlus");
                case (#none_) #Text("None");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserSubscriptionType =
            switch (candid) {
                case (#Text("Basic")) ?#basic;
                case (#Text("Premium")) ?#premium;
                case (#Text("PremiumPlus")) ?#premiumplus;
                case (#Text("None")) ?#none_;
                case _ null;
            };

        public func toText(value : UserSubscriptionType) : Text =
            switch (value) {
                case (#basic) "Basic";
                case (#premium) "Premium";
                case (#premiumplus) "PremiumPlus";
                case (#none_) "None";
            };
    };
};
