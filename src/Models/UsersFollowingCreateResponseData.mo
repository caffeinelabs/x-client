import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsersFollowingCreateResponseData.mo

module {
    public type UsersFollowingCreateResponseData = {
        following : ?Bool;
        pending_follow : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : UsersFollowingCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.following) {
                case (?v__) List.add(buf, ("following", #Bool(v__)));
                case null ();
            };
            switch (value.pending_follow) {
                case (?v__) List.add(buf, ("pending_follow", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersFollowingCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let following : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "following")) {
                        case (?following_field) ((switch (following_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let pending_follow : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "pending_follow")) {
                        case (?pending_follow_field) ((switch (pending_follow_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        following;
                        pending_follow;
                    };
                };
                case _ null;
            };
    };
};
