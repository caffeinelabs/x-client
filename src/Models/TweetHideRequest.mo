import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetHideRequest.mo

module {
    public type TweetHideRequest = {
        hidden : Bool;
    };

    public module JSON {
        public func toCandidValue(value : TweetHideRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("hidden", #Bool(value.hidden)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetHideRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?hidden_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hidden") else return null;
                    let ?hidden = ((switch (hidden_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        hidden;
                    };
                };
                case _ null;
            };
    };
};
