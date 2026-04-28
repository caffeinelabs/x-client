import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ConnectionExceptionProblemAllOfConnectionIssue.mo
/// Enum values: #toomanyconnections, #provisioningsubscription, #ruleconfigurationissue, #rulesinvalidissue

module {
    public type ConnectionExceptionProblemAllOfConnectionIssue = {
        #toomanyconnections;
        #provisioningsubscription;
        #ruleconfigurationissue;
        #rulesinvalidissue;
    };

    public module JSON {
        public func toCandidValue(value : ConnectionExceptionProblemAllOfConnectionIssue) : Candid.Candid =
            switch (value) {
                case (#toomanyconnections) #Text("TooManyConnections");
                case (#provisioningsubscription) #Text("ProvisioningSubscription");
                case (#ruleconfigurationissue) #Text("RuleConfigurationIssue");
                case (#rulesinvalidissue) #Text("RulesInvalidIssue");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ConnectionExceptionProblemAllOfConnectionIssue =
            switch (candid) {
                case (#Text("TooManyConnections")) ?#toomanyconnections;
                case (#Text("ProvisioningSubscription")) ?#provisioningsubscription;
                case (#Text("RuleConfigurationIssue")) ?#ruleconfigurationissue;
                case (#Text("RulesInvalidIssue")) ?#rulesinvalidissue;
                case _ null;
            };

        public func toText(value : ConnectionExceptionProblemAllOfConnectionIssue) : Text =
            switch (value) {
                case (#toomanyconnections) "TooManyConnections";
                case (#provisioningsubscription) "ProvisioningSubscription";
                case (#ruleconfigurationissue) "RuleConfigurationIssue";
                case (#rulesinvalidissue) "RulesInvalidIssue";
            };
    };
};
