/// Type of compliance job to list.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateComplianceJobRequestType.mo
/// Enum values: #tweets, #users

module {
    public type CreateComplianceJobRequestType = {
        #tweets;
        #users;
    };

    public module JSON {
        public func toCandidValue(value : CreateComplianceJobRequestType) : Candid.Candid =
            switch (value) {
                case (#tweets) #Text("tweets");
                case (#users) #Text("users");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateComplianceJobRequestType =
            switch (candid) {
                case (#Text("tweets")) ?#tweets;
                case (#Text("users")) ?#users;
                case _ null;
            };

        public func toText(value : CreateComplianceJobRequestType) : Text =
            switch (value) {
                case (#tweets) "tweets";
                case (#users) "users";
            };
    };
};
