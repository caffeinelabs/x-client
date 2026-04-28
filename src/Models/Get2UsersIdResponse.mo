
import { type Expansions; JSON = Expansions } "./Expansions";

import { type Problem; JSON = Problem } "./Problem";

import { type User; JSON = User } "./User";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2UsersIdResponse.mo

module {
    public type Get2UsersIdResponse = {
        data : ?User;
        errors : ?[Problem];
        includes : ?Expansions;
    };

    public module JSON {
        public func toCandidValue(value : Get2UsersIdResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", User.toCandidValue(v__)));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.includes) {
                case (?v__) List.add(buf, ("includes", Expansions.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersIdResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?User = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) (User.fromCandidValue(data_field.1));
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
                    let includes : ?Expansions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "includes")) {
                        case (?includes_field) (Expansions.fromCandidValue(includes_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        includes;
                    };
                };
                case _ null;
            };
    };
};
