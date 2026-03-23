
import { type AddRulesRequest; JSON = AddRulesRequest } "./AddRulesRequest";

import { type DeleteRulesRequest; JSON = DeleteRulesRequest } "./DeleteRulesRequest";

import { type DeleteRulesRequestDelete; JSON = DeleteRulesRequestDelete } "./DeleteRulesRequestDelete";

import { type RuleNoId; JSON = RuleNoId } "./RuleNoId";

// AddOrDeleteRulesRequest.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type AddOrDeleteRulesRequest = {
        #AddRulesRequest : AddRulesRequest;
        #DeleteRulesRequest : DeleteRulesRequest;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : AddOrDeleteRulesRequest) : Text =
            switch (value) {
                case (#AddRulesRequest(v)) Runtime.unreachable();
                case (#DeleteRulesRequest(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer AddOrDeleteRulesRequest type
        public type JSON = {
            #AddRulesRequest : AddRulesRequest;
            #DeleteRulesRequest : DeleteRulesRequest;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : AddOrDeleteRulesRequest) : JSON =
            switch (value) {
                case (#AddRulesRequest(v)) #AddRulesRequest(v);
                case (#DeleteRulesRequest(v)) #DeleteRulesRequest(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?AddOrDeleteRulesRequest =
            switch (json) {
                case (#AddRulesRequest(v)) ?#AddRulesRequest(v);
                case (#DeleteRulesRequest(v)) ?#DeleteRulesRequest(v);
            };
    }
}
