/// A request to add a user-specified stream filtering rule.

import { type RuleNoId; JSON = RuleNoId } "./RuleNoId";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AddRulesRequest.mo

module {
    public type AddRulesRequest = {
        add : [RuleNoId];
    };

    public module JSON {
        public func toCandidValue(value : AddRulesRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("add", #Array(Array.map<RuleNoId, Candid.Candid>(value.add, RuleNoId.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AddRulesRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?add_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "add") else return null;
                    let ?add = ((switch (add_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<RuleNoId>();
                            for (c__ in xs__.values()) {
                                let ?m__ = RuleNoId.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        add;
                    };
                };
                case _ null;
            };
    };
};
