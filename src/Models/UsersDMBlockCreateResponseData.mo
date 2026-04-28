import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UsersDMBlockCreateResponseData.mo

module {
    public type UsersDMBlockCreateResponseData = {
        blocked : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : UsersDMBlockCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.blocked) {
                case (?v__) List.add(buf, ("blocked", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsersDMBlockCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let blocked : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "blocked")) {
                        case (?blocked_field) ((switch (blocked_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        blocked;
                    };
                };
                case _ null;
            };
    };
};
