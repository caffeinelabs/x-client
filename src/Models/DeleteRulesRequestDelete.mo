/// IDs and values of all deleted user-specified stream filtering rules.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// DeleteRulesRequestDelete.mo

module {
    public type DeleteRulesRequestDelete = {
        /// IDs of all deleted user-specified stream filtering rules.
        ids : ?[Text];
        /// Values of all deleted user-specified stream filtering rules.
        values : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : DeleteRulesRequestDelete) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.ids) {
                case (?v__) List.add(buf, ("ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.values) {
                case (?v__) List.add(buf, ("values", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DeleteRulesRequestDelete =
            switch (candid) {
                case (#Record(fields)) {
                    let ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "ids")) {
                        case (?ids_field) ((switch (ids_field.1) {
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
                    let values : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "values")) {
                        case (?values_field) ((switch (values_field.1) {
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
                        ids;
                        values;
                    };
                };
                case _ null;
            };
    };
};
