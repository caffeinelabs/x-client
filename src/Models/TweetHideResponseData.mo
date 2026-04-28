import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetHideResponseData.mo

module {
    public type TweetHideResponseData = {
        hidden : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : TweetHideResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.hidden) {
                case (?v__) List.add(buf, ("hidden", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetHideResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let hidden : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hidden")) {
                        case (?hidden_field) ((switch (hidden_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        hidden;
                    };
                };
                case _ null;
            };
    };
};
