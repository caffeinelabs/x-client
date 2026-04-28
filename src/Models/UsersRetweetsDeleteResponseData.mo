import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsersRetweetsDeleteResponseData.mo

module {
    public type UsersRetweetsDeleteResponseData = {
        retweeted : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : UsersRetweetsDeleteResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.retweeted) {
                case (?v__) List.add(buf, ("retweeted", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersRetweetsDeleteResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let retweeted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "retweeted")) {
                        case (?retweeted_field) ((switch (retweeted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        retweeted;
                    };
                };
                case _ null;
            };
    };
};
