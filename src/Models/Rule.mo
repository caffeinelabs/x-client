/// A user-provided stream filtering rule.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Rule.mo

module {
    public type Rule = {
        /// Unique identifier of this rule.
        id : ?Text;
        /// A tag meant for the labeling of user provided rules.
        tag : ?Text;
        /// The filterlang value of the rule.
        value : Text;
    };

    public module JSON {
        // `init` constructs a Rule from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Rule.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            value : Text;
        }) : Rule {
            let ?res = from_candid(to_candid(required)) : ?Rule else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Rule) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.tag) {
                case (?v__) List.add(buf, ("tag", #Text(v__)));
                case null ();
            };
            List.add(buf, ("value", #Text(value.value)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Rule =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let tag : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tag")) {
                        case (?tag_field) ((switch (tag_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?value_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "value") else return null;
                    let ?value = ((switch (value_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                        tag;
                        value;
                    };
                };
                case _ null;
            };
    };
};
