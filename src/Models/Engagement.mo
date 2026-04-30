/// An Engagement Api Response.

import { type EngagementErrorsInner; JSON = EngagementErrorsInner } "./EngagementErrorsInner";

import { type EngagementMeasurement; JSON = EngagementMeasurement } "./EngagementMeasurement";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Engagement.mo

module {
    public type Engagement = {
        errors : ?[EngagementErrorsInner];
        measurement : ?EngagementMeasurement;
    };

    public module JSON {
        // `init` constructs a Engagement from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Engagement.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : Engagement {
            let ?res = from_candid(to_candid(required)) : ?Engagement else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Engagement) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<EngagementErrorsInner, Candid.Candid>(v__, EngagementErrorsInner.toCandidValue))));
                case null ();
            };
            switch (value.measurement) {
                case (?v__) List.add(buf, ("measurement", EngagementMeasurement.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Engagement =
            switch (candid) {
                case (#Record(fields)) {
                    let errors : ?[EngagementErrorsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<EngagementErrorsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = EngagementErrorsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let measurement : ?EngagementMeasurement = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "measurement")) {
                        case (?measurement_field) (EngagementMeasurement.fromCandidValue(measurement_field.1));
                        case null null;
                    };
                    ?{
                        errors;
                        measurement;
                    };
                };
                case _ null;
            };
    };
};
