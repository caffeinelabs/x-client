/// Indicates that the content being withheld is a `user`.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserWithheldScope.mo
/// Enum values: #user

module {
    public type UserWithheldScope = {
        #user;
    };

    public module JSON {
        public func toCandidValue(value : UserWithheldScope) : Candid.Candid =
            switch (value) {
                case (#user) #Text("user");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserWithheldScope =
            switch (candid) {
                case (#Text("user")) ?#user;
                case _ null;
            };

        public func toText(value : UserWithheldScope) : Text =
            switch (value) {
                case (#user) "user";
            };
    };
};
