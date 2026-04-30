import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ClientForbiddenProblemAllOfReason.mo
/// Enum values: #official_client_forbidden, #client_not_enrolled

module {
    public type ClientForbiddenProblemAllOfReason = {
        #official_client_forbidden;
        #client_not_enrolled;
    };

    public module JSON {
        public func toCandidValue(value : ClientForbiddenProblemAllOfReason) : Candid.Candid =
            switch (value) {
                case (#official_client_forbidden) #Text("official-client-forbidden");
                case (#client_not_enrolled) #Text("client-not-enrolled");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ClientForbiddenProblemAllOfReason =
            switch (candid) {
                case (#Text("official-client-forbidden")) ?#official_client_forbidden;
                case (#Text("client-not-enrolled")) ?#client_not_enrolled;
                case _ null;
            };

        public func toText(value : ClientForbiddenProblemAllOfReason) : Text =
            switch (value) {
                case (#official_client_forbidden) "official-client-forbidden";
                case (#client_not_enrolled) "client-not-enrolled";
            };
    };
};
