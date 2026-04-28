import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NewsContextsSports.mo

module {
    public type NewsContextsSports = {
        teams : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : NewsContextsSports) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.teams) {
                case (?v__) List.add(buf, ("teams", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsContextsSports =
            switch (candid) {
                case (#Record(fields)) {
                    let teams : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "teams")) {
                        case (?teams_field) ((switch (teams_field.1) {
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
                        teams;
                    };
                };
                case _ null;
            };
    };
};
