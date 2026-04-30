/// Represents the data for Usage
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsageFields.mo

module {
    public type UsageFields = {
        /// The time period for the usage
        date : ?Text;
        /// The usage value
        usage : ?Int;
    };

    public module JSON {
        // `init` constructs a UsageFields from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsageFields.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : UsageFields {
            let ?res = from_candid(to_candid(required)) : ?UsageFields else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsageFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.date) {
                case (?v__) List.add(buf, ("date", #Text(v__)));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageFields =
            switch (candid) {
                case (#Record(fields)) {
                    let date : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "date")) {
                        case (?date_field) ((switch (date_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let usage : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) ((switch (usage_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        date;
                        usage;
                    };
                };
                case _ null;
            };
    };
};
