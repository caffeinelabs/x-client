import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// SharedInfo.mo

module {
    public type SharedInfo = {
        /// Indicates if the media is shared in direct messages
        shared_ : Bool;
    };

    public module JSON {
        // `init` constructs a SharedInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { SharedInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            shared_ : Bool;
        }) : SharedInfo {
            let ?res = from_candid(to_candid(required)) : ?SharedInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : SharedInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("shared", #Bool(value.shared_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SharedInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?shared__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "shared") else return null;
                    let ?shared_ = ((switch (shared__field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        shared_;
                    };
                };
                case _ null;
            };
    };
};
