import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ListFollowedResponseData.mo

module {
    public type ListFollowedResponseData = {
        following : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ListFollowedResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.following) {
                case (?v__) List.add(buf, ("following", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ListFollowedResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let following : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "following")) {
                        case (?following_field) ((switch (following_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        following;
                    };
                };
                case _ null;
            };
    };
};
