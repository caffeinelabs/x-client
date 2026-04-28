import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NewsContextsFinance.mo

module {
    public type NewsContextsFinance = {
        tickers : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : NewsContextsFinance) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.tickers) {
                case (?v__) List.add(buf, ("tickers", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsContextsFinance =
            switch (candid) {
                case (#Record(fields)) {
                    let tickers : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tickers")) {
                        case (?tickers_field) ((switch (tickers_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        tickers;
                    };
                };
                case _ null;
            };
    };
};
