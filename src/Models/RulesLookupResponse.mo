
import { type Rule; JSON = Rule } "./Rule";

import { type RulesResponseMetadata; JSON = RulesResponseMetadata } "./RulesResponseMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// RulesLookupResponse.mo

module {
    public type RulesLookupResponse = {
        data : ?[Rule];
        meta : RulesResponseMetadata;
    };

    public module JSON {
        public func toCandidValue(value : RulesLookupResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<Rule, Candid.Candid>(v__, Rule.toCandidValue))));
                case null ();
            };
            List.add(buf, ("meta", RulesResponseMetadata.toCandidValue(value.meta)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesLookupResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[Rule] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Rule>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Rule.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?meta_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta") else return null;
                    let ?meta = (RulesResponseMetadata.fromCandidValue(meta_field.1)) else return null;
                    ?{
                        data;
                        meta;
                    };
                };
                case _ null;
            };
    };
};
