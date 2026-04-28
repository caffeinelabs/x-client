import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsersLikesCreateResponseData.mo

module {
    public type UsersLikesCreateResponseData = {
        liked : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : UsersLikesCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.liked) {
                case (?v__) List.add(buf, ("liked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersLikesCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let liked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "liked")) {
                        case (?liked_field) ((switch (liked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        liked;
                    };
                };
                case _ null;
            };
    };
};
