
import { type KillAllConnectionsResponseDataResultsInner; JSON = KillAllConnectionsResponseDataResultsInner } "./KillAllConnectionsResponseDataResultsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// KillAllConnectionsResponseData.mo

module {
    public type KillAllConnectionsResponseData = {
        failed_kills : ?Int;
        results : ?[KillAllConnectionsResponseDataResultsInner];
        successful_kills : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : KillAllConnectionsResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.failed_kills) {
                case (?v__) List.add(buf, ("failed_kills", #Int(v__)));
                case null ();
            };
            switch (value.results) {
                case (?v__) List.add(buf, ("results", #Array(Array.map<KillAllConnectionsResponseDataResultsInner, Candid.Candid>(v__, KillAllConnectionsResponseDataResultsInner.toCandidValue))));
                case null ();
            };
            switch (value.successful_kills) {
                case (?v__) List.add(buf, ("successful_kills", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?KillAllConnectionsResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let failed_kills : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "failed_kills")) {
                        case (?failed_kills_field) ((switch (failed_kills_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let results : ?[KillAllConnectionsResponseDataResultsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "results")) {
                        case (?results_field) ((switch (results_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<KillAllConnectionsResponseDataResultsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = KillAllConnectionsResponseDataResultsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let successful_kills : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "successful_kills")) {
                        case (?successful_kills_field) ((switch (successful_kills_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        failed_kills;
                        results;
                        successful_kills;
                    };
                };
                case _ null;
            };
    };
};
