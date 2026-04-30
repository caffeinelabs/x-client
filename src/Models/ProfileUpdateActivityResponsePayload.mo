import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ProfileUpdateActivityResponsePayload.mo

module {
    public type ProfileUpdateActivityResponsePayload = {
        after : ?Text;
        before : ?Text;
    };

    public module JSON {
        // `init` constructs a ProfileUpdateActivityResponsePayload from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ProfileUpdateActivityResponsePayload.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ProfileUpdateActivityResponsePayload {
            let ?res = from_candid(to_candid(required)) : ?ProfileUpdateActivityResponsePayload else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ProfileUpdateActivityResponsePayload) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.after) {
                case (?v__) List.add(buf, ("after", #Text(v__)));
                case null ();
            };
            switch (value.before) {
                case (?v__) List.add(buf, ("before", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ProfileUpdateActivityResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let after : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "after")) {
                        case (?after_field) ((switch (after_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let before : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "before")) {
                        case (?before_field) ((switch (before_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        after;
                        before;
                    };
                };
                case _ null;
            };
    };
};
