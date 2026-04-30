/// Annotation inferred from the Tweet text.

import { type ContextAnnotationDomainFields; JSON = ContextAnnotationDomainFields } "./ContextAnnotationDomainFields";

import { type ContextAnnotationEntityFields; JSON = ContextAnnotationEntityFields } "./ContextAnnotationEntityFields";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ContextAnnotation.mo

module {
    public type ContextAnnotation = {
        domain : ContextAnnotationDomainFields;
        entity : ContextAnnotationEntityFields;
    };

    public module JSON {
        // `init` constructs a ContextAnnotation from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ContextAnnotation.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            domain : ContextAnnotationDomainFields;
            entity : ContextAnnotationEntityFields;
        }) : ContextAnnotation {
            let ?res = from_candid(to_candid(required)) : ?ContextAnnotation else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ContextAnnotation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("domain", ContextAnnotationDomainFields.toCandidValue(value.domain)));
            List.add(buf, ("entity", ContextAnnotationEntityFields.toCandidValue(value.entity)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ContextAnnotation =
            switch (candid) {
                case (#Record(fields)) {
                    let ?domain_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "domain") else return null;
                    let ?domain = (ContextAnnotationDomainFields.fromCandidValue(domain_field.1)) else return null;
                    let ?entity_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entity") else return null;
                    let ?entity = (ContextAnnotationEntityFields.fromCandidValue(entity_field.1)) else return null;
                    ?{
                        domain;
                        entity;
                    };
                };
                case _ null;
            };
    };
};
