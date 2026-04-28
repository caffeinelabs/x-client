import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListPinnedResponseData.mo

module {
    public type ListPinnedResponseData = {
        pinned : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ListPinnedResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.pinned) {
                case (?v__) List.add(buf, ("pinned", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListPinnedResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let pinned : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "pinned")) {
                        case (?pinned_field) ((switch (pinned_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        pinned;
                    };
                };
                case _ null;
            };
    };
};
