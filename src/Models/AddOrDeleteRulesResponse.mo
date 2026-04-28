/// A response from modifying user-specified stream filtering rules.

import { type Problem; JSON = Problem } "./Problem";

import { type Rule; JSON = Rule } "./Rule";

import { type RulesResponseMetadata; JSON = RulesResponseMetadata } "./RulesResponseMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AddOrDeleteRulesResponse.mo

module {
    public type AddOrDeleteRulesResponse = {
        /// All user-specified stream filtering rules that were created.
        data : ?[Rule];
        errors : ?[Problem];
        meta : RulesResponseMetadata;
    };

    public module JSON {
        public func toCandidValue(value : AddOrDeleteRulesResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<Rule, Candid.Candid>(v__, Rule.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            List.add(buf, ("meta", RulesResponseMetadata.toCandidValue(value.meta)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AddOrDeleteRulesResponse =
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
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
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
                        errors;
                        meta;
                    };
                };
                case _ null;
            };
    };
};
