
import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// LikesComplianceStreamResponseOneOf1.mo

module {
    public type LikesComplianceStreamResponseOneOf1 = {
        errors : [Problem];
    };

    public module JSON {
        public func toCandidValue(value : LikesComplianceStreamResponseOneOf1) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(value.errors, Problem.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?LikesComplianceStreamResponseOneOf1 =
            switch (candid) {
                case (#Record(fields)) {
                    let ?errors_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors") else return null;
                    let ?errors = ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        errors;
                    };
                };
                case _ null;
            };
    };
};
