import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// KillConnectionsByUuidsRequest.mo

module {
    public type KillConnectionsByUuidsRequest = {
        /// Array of connection UUIDs to terminate
        uuids : [Text];
    };

    public module JSON {
        // `init` constructs a KillConnectionsByUuidsRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { KillConnectionsByUuidsRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            uuids : [Text];
        }) : KillConnectionsByUuidsRequest {
            let ?res = from_candid(to_candid(required)) : ?KillConnectionsByUuidsRequest else Runtime.unreachable();
            res
        };

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
