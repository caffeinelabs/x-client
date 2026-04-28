import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MuteUserMutationResponseData.mo

module {
    public type MuteUserMutationResponseData = {
        muting : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : MuteUserMutationResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.muting) {
                case (?v__) List.add(buf, ("muting", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MuteUserMutationResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let muting : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "muting")) {
                        case (?muting_field) ((switch (muting_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        muting;
                    };
                };
                case _ null;
            };
    };
};
