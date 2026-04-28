import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsageCapExceededProblemAllOfScope.mo
/// Enum values: #account, #product

module {
    public type UsageCapExceededProblemAllOfScope = {
        #account;
        #product;
    };

    public module JSON {
        public func toCandidValue(value : UsageCapExceededProblemAllOfScope) : Candid.Candid =
            switch (value) {
                case (#account) #Text("Account");
                case (#product) #Text("Product");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageCapExceededProblemAllOfScope =
            switch (candid) {
                case (#Text("Account")) ?#account;
                case (#Text("Product")) ?#product;
                case _ null;
            };

        public func toText(value : UsageCapExceededProblemAllOfScope) : Text =
            switch (value) {
                case (#account) "Account";
                case (#product) "Product";
            };
    };
};
