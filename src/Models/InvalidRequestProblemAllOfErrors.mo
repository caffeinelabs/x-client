import { type Map; entries; fromIter } "mo:core/pure/Map";
import Text "mo:core/Text";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// InvalidRequestProblemAllOfErrors.mo

module {
    public type InvalidRequestProblemAllOfErrors = {
        message : ?Text;
        parameters : ?Map<Text, [Text]>;
    };

    public module JSON {
        public func toCandidValue(value : InvalidRequestProblemAllOfErrors) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.message) {
                case (?v__) List.add(buf, ("message", #Text(v__)));
                case null ();
            };
            switch (value.parameters) {
                case (?v__) List.add(buf, ("parameters", #Record(Array.map<(Text, [Text]), (Text, Candid.Candid)>(Array.fromIter(entries(v__)), func((k, v) : (Text, [Text])) : (Text, Candid.Candid) = (k, [Text].toCandidValue(v))))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?InvalidRequestProblemAllOfErrors =
            switch (candid) {
                case (#Record(fields)) {
                    let message : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message")) {
                        case (?message_field) ((switch (message_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let parameters : ?Map<Text, [Text]> = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "parameters")) {
                        case (?parameters_field) ((switch (parameters_field.1) {
                        case (#Record(pairs__)) {
                            let buf__ = List.empty<(Text, [Text])>();
                            for ((k__, c__) in pairs__.values()) {
                                let ?v__ = [Text].fromCandidValue(c__) else return null;
                                List.add(buf__, (k__, v__));
                            };
                            ?fromIter<Text, [Text]>(List.toArray(buf__).values(), Text.compare);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        message;
                        parameters;
                    };
                };
                case _ null;
            };
    };
};
