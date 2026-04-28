/// A response from deleting user-specified stream filtering rules.

import { type DeleteRulesRequestDelete; JSON = DeleteRulesRequestDelete } "./DeleteRulesRequestDelete";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DeleteRulesRequest.mo

module {
    public type DeleteRulesRequest = {
        delete : DeleteRulesRequestDelete;
    };

    public module JSON {
        public func toCandidValue(value : DeleteRulesRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("delete", DeleteRulesRequestDelete.toCandidValue(value.delete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteRulesRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?delete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delete") else return null;
                    let ?delete = (DeleteRulesRequestDelete.fromCandidValue(delete_field.1)) else return null;
                    ?{
                        delete;
                    };
                };
                case _ null;
            };
    };
};
