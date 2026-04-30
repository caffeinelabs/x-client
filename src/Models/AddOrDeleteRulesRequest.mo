
import { type AddRulesRequest; JSON = AddRulesRequest } "./AddRulesRequest";

import { type DeleteRulesRequest; JSON = DeleteRulesRequest } "./DeleteRulesRequest";

import { type DeleteRulesRequestDelete; JSON = DeleteRulesRequestDelete } "./DeleteRulesRequestDelete";

import { type RuleNoId; JSON = RuleNoId } "./RuleNoId";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AddOrDeleteRulesRequest.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type AddOrDeleteRulesRequest = {
        #AddRulesRequest : AddRulesRequest;
        #DeleteRulesRequest : DeleteRulesRequest;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : AddOrDeleteRulesRequest) : Text =
            switch (value) {
                case (#AddRulesRequest(v)) Runtime.unreachable();
                case (#DeleteRulesRequest(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : AddOrDeleteRulesRequest) : Candid.Candid =
            switch (value) {
                case (#AddRulesRequest(v)) #Variant(("AddRulesRequest", AddRulesRequest.toCandidValue(v)));
                case (#DeleteRulesRequest(v)) #Variant(("DeleteRulesRequest", DeleteRulesRequest.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?AddOrDeleteRulesRequest =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("AddRulesRequest") {
                            let ?inner = AddRulesRequest.fromCandidValue(tagAndVal.1) else return null;
                            ?#AddRulesRequest(inner)
                        };
                        case ("DeleteRulesRequest") {
                            let ?inner = DeleteRulesRequest.fromCandidValue(tagAndVal.1) else return null;
                            ?#DeleteRulesRequest(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};
