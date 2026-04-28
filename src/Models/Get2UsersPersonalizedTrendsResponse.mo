
import { type PersonalizedTrend; JSON = PersonalizedTrend } "./PersonalizedTrend";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2UsersPersonalizedTrendsResponse.mo

module {
    public type Get2UsersPersonalizedTrendsResponse = {
        data : ?[PersonalizedTrend];
        errors : ?[Problem];
    };

    public module JSON {
        public func toCandidValue(value : Get2UsersPersonalizedTrendsResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<PersonalizedTrend, Candid.Candid>(v__, PersonalizedTrend.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersPersonalizedTrendsResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[PersonalizedTrend] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<PersonalizedTrend>();
                            for (c__ in xs__.values()) {
                                let ?m__ = PersonalizedTrend.fromCandidValue(c__) else return null;
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
                    ?{
                        data;
                        errors;
                    };
                };
                case _ null;
            };
    };
};
