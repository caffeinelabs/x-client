/// Type of compliance job to list.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ComplianceJobType.mo
/// Enum values: #tweets, #users

module {
    public type ComplianceJobType = {
        #tweets;
        #users;
    };

    public module JSON {
        public func toCandidValue(value : ComplianceJobType) : Candid.Candid =
            switch (value) {
                case (#tweets) #Text("tweets");
                case (#users) #Text("users");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ComplianceJobType =
            switch (candid) {
                case (#Text("tweets")) ?#tweets;
                case (#Text("users")) ?#users;
                case _ null;
            };

        public func toText(value : ComplianceJobType) : Text =
            switch (value) {
                case (#tweets) "tweets";
                case (#users) "users";
            };
    };
};
