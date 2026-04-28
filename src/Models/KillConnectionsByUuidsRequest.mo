import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// KillConnectionsByUuidsRequest.mo

module {
    public type KillConnectionsByUuidsRequest = {
        /// Array of connection UUIDs to terminate
        uuids : [Text];
    };

    public module JSON {
        public func toCandidValue(value : KillConnectionsByUuidsRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("uuids", #Array(Array.map<Text, Candid.Candid>(value.uuids, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?KillConnectionsByUuidsRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?uuids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "uuids") else return null;
                    let ?uuids = ((switch (uuids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        uuids;
                    };
                };
                case _ null;
            };
    };
};
