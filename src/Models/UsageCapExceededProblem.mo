/// A problem that indicates that a usage cap has been exceeded.

import { type Problem; JSON = Problem } "./Problem";

import { type UsageCapExceededProblemAllOfPeriod; JSON = UsageCapExceededProblemAllOfPeriod } "./UsageCapExceededProblemAllOfPeriod";

import { type UsageCapExceededProblemAllOfScope; JSON = UsageCapExceededProblemAllOfScope } "./UsageCapExceededProblemAllOfScope";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UsageCapExceededProblem.mo

module {
    public type UsageCapExceededProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        period : ?UsageCapExceededProblemAllOfPeriod;
        scope : ?UsageCapExceededProblemAllOfScope;
    };

    public module JSON {
        // `init` constructs a UsageCapExceededProblem from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UsageCapExceededProblem.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            title : Text;
            type_ : Text;
        }) : UsageCapExceededProblem {
            let ?res = from_candid(to_candid(required)) : ?UsageCapExceededProblem else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UsageCapExceededProblem) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.detail) {
                case (?v__) List.add(buf, ("detail", #Text(v__)));
                case null ();
            };
            switch (value.status) {
                case (?v__) List.add(buf, ("status", #Int(v__)));
                case null ();
            };
            List.add(buf, ("title", #Text(value.title)));
            List.add(buf, ("type", #Text(value.type_)));
            switch (value.period) {
                case (?v__) List.add(buf, ("period", UsageCapExceededProblemAllOfPeriod.toCandidValue(v__)));
                case null ();
            };
            switch (value.scope) {
                case (?v__) List.add(buf, ("scope", UsageCapExceededProblemAllOfScope.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UsageCapExceededProblem =
            switch (candid) {
                case (#Record(fields)) {
                    let detail : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "detail")) {
                        case (?detail_field) ((switch (detail_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let status : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status")) {
                        case (?status_field) ((switch (status_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?title_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title") else return null;
                    let ?title = ((switch (title_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let period : ?UsageCapExceededProblemAllOfPeriod = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "period")) {
                        case (?period_field) (UsageCapExceededProblemAllOfPeriod.fromCandidValue(period_field.1));
                        case null null;
                    };
                    let scope : ?UsageCapExceededProblemAllOfScope = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "scope")) {
                        case (?scope_field) (UsageCapExceededProblemAllOfScope.fromCandidValue(scope_field.1));
                        case null null;
                    };
                    ?{
                        detail;
                        status;
                        title;
                        type_;
                        period;
                        scope;
                    };
                };
                case _ null;
            };
    };
};
