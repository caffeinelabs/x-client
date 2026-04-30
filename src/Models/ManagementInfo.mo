import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ManagementInfo.mo

module {
    public type ManagementInfo = {
        /// Indicates if the media is managed by Media Studio
        managed : Bool;
    };

    public module JSON {
        // `init` constructs a ManagementInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ManagementInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            managed : Bool;
        }) : ManagementInfo {
            let ?res = from_candid(to_candid(required)) : ?ManagementInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ManagementInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("managed", #Bool(value.managed)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ManagementInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?managed_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "managed") else return null;
                    let ?managed = ((switch (managed_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        managed;
                    };
                };
                case _ null;
            };
    };
};
