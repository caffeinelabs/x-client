import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetListsByIdExpansionsParameterInner.mo
/// Enum values: #owner_id

module {
    public type GetListsByIdExpansionsParameterInner = {
        #owner_id;
    };

    public module JSON {
        public func toCandidValue(value : GetListsByIdExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#owner_id) #Text("owner_id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsByIdExpansionsParameterInner =
            switch (candid) {
                case (#Text("owner_id")) ?#owner_id;
                case _ null;
            };

        public func toText(value : GetListsByIdExpansionsParameterInner) : Text =
            switch (value) {
                case (#owner_id) "owner_id";
            };
    };
};
