/// The X Blue verified type of the user, eg: blue, government, business or none.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserVerifiedType.mo
/// Enum values: #blue, #government, #business, #none_

module {
    public type UserVerifiedType = {
        #blue;
        #government;
        #business;
        #none_;
    };

    public module JSON {
        public func toCandidValue(value : UserVerifiedType) : Candid.Candid =
            switch (value) {
                case (#blue) #Text("blue");
                case (#government) #Text("government");
                case (#business) #Text("business");
                case (#none_) #Text("none");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserVerifiedType =
            switch (candid) {
                case (#Text("blue")) ?#blue;
                case (#Text("government")) ?#government;
                case (#Text("business")) ?#business;
                case (#Text("none")) ?#none_;
                case _ null;
            };

        public func toText(value : UserVerifiedType) : Text =
            switch (value) {
                case (#blue) "blue";
                case (#government) "government";
                case (#business) "business";
                case (#none_) "none";
            };
    };
};
