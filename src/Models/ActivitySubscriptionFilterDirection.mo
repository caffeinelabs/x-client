/// Optional direction filter for directional events.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ActivitySubscriptionFilterDirection.mo
/// Enum values: #inbound, #outbound

module {
    public type ActivitySubscriptionFilterDirection = {
        #inbound;
        #outbound;
    };

    public module JSON {
        public func toCandidValue(value : ActivitySubscriptionFilterDirection) : Candid.Candid =
            switch (value) {
                case (#inbound) #Text("inbound");
                case (#outbound) #Text("outbound");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivitySubscriptionFilterDirection =
            switch (candid) {
                case (#Text("inbound")) ?#inbound;
                case (#Text("outbound")) ?#outbound;
                case _ null;
            };

        public func toText(value : ActivitySubscriptionFilterDirection) : Text =
            switch (value) {
                case (#inbound) "inbound";
                case (#outbound) "outbound";
            };
    };
};
